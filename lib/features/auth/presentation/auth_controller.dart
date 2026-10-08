import 'package:flutter/foundation.dart';

import '../domain/auth_session.dart';
import '../domain/customer_registration.dart';
import '../domain/usecases/register_customer.dart';
import '../domain/usecases/login_customer.dart';
import '../domain/usecases/logout.dart';
import '../domain/usecases/restore_session.dart';

enum AuthStatus { restoring, restoreFailed, signedOut, signingIn, signedIn }

class AuthController extends ChangeNotifier {
  AuthController(
    this._login,
    this._logout,
    this._restoreSession,
    this._register,
  ) {
    Future.microtask(restore);
  }

  final LoginCustomer _login;
  final Logout _logout;
  final RestoreSession _restoreSession;
  final RegisterCustomer _register;

  AuthStatus _status = AuthStatus.restoring;
  AuthSession? _session;
  String? _errorMessage;

  AuthStatus get status => _status;
  AuthSession? get session => _session;
  String? get errorMessage => _errorMessage;
  bool get isSignedIn => _status == AuthStatus.signedIn && _session != null;

  Future<void> restore() async {
    _status = AuthStatus.restoring;
    _errorMessage = null;
    notifyListeners();
    try {
      _session = await _restoreSession();
      _status = _session == null ? AuthStatus.signedOut : AuthStatus.signedIn;
    } catch (error) {
      _status = AuthStatus.restoreFailed;
      _errorMessage = error.toString();
    }
    notifyListeners();
  }

  Future<bool> login({
    required String identifier,
    required String password,
  }) async {
    if (_status == AuthStatus.signingIn) return false;

    _status = AuthStatus.signingIn;
    _errorMessage = null;
    notifyListeners();

    try {
      _session = await _login(identifier: identifier, password: password);
      _status = AuthStatus.signedIn;
      notifyListeners();
      return true;
    } catch (error) {
      _session = null;
      _status = AuthStatus.signedOut;
      _errorMessage = error.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _logout();
    _session = null;
    _errorMessage = null;
    _status = AuthStatus.signedOut;
    notifyListeners();
  }

  Future<bool> register(CustomerRegistration input) async {
    if (_status == AuthStatus.signingIn) return false;
    _status = AuthStatus.signingIn;
    _errorMessage = null;
    notifyListeners();
    try {
      _session = await _register(input);
      _status = AuthStatus.signedIn;
      notifyListeners();
      return true;
    } catch (error) {
      _session = null;
      _status = AuthStatus.signedOut;
      _errorMessage = error.toString();
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    if (_errorMessage == null) return;
    _errorMessage = null;
    notifyListeners();
  }
}
