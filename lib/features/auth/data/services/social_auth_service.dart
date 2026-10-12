import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Contract for fetching real social authentication tokens from SDKs.
abstract interface class SocialAuthService {
  /// Launches native Google Sign-In and returns the Google [idToken].
  /// Returns `null` if the user cancelled the sign-in dialog.
  Future<String?> signInWithGoogle({String? serverClientId});

  /// Launches native Facebook Login and returns the Facebook [accessToken].
  /// Returns `null` if the user cancelled the login dialog.
  Future<String?> signInWithFacebook();

  /// Logs out from social provider sessions.
  Future<void> signOut();
}

class FlutterSocialAuthService implements SocialAuthService {
  bool _googleInitialized = false;

  @override
  Future<String?> signInWithGoogle({String? serverClientId}) async {
    try {
      if (!_googleInitialized) {
        await GoogleSignIn.instance.initialize(
          serverClientId: serverClientId,
        );
        _googleInitialized = true;
      }
      final account = await GoogleSignIn.instance.authenticate();
      final token = account.authentication.idToken;
      if (token == null) {
        throw StateError(
          'Google Sign-In succeeded but did not return an idToken. '
          'Please ensure serverClientId (Web Client ID) is configured.',
        );
      }
      return token;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null; // User cancelled
      }
      debugPrint('[SocialAuthService] Google Sign-In exception: $e');
      rethrow;
    } catch (error) {
      debugPrint('[SocialAuthService] Google Sign-In error: $error');
      rethrow;
    }
  }

  @override
  Future<String?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login(
        permissions: const ['email', 'public_profile'],
      );
      if (result.status == LoginStatus.success) {
        final token = result.accessToken?.token;
        if (token == null) {
          throw StateError('Facebook Login succeeded but accessToken is empty.');
        }
        return token;
      } else if (result.status == LoginStatus.cancelled) {
        // User cancelled
        return null;
      } else {
        throw StateError(result.message ?? 'Facebook Login failed.');
      }
    } catch (error) {
      debugPrint('[SocialAuthService] Facebook Login error: $error');
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
    } catch (_) {}
    try {
      await FacebookAuth.instance.logOut();
    } catch (_) {}
  }
}
