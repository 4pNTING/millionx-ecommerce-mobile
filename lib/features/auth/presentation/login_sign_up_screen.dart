import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../home/presentation/home_screen.dart';
import 'auth_controller.dart';
import 'auth_providers.dart';
import 'onboarding_screen.dart';
import 'register_screen.dart';
import 'widgets/social_brand_icons.dart';
import 'widgets/social_login_bottom_sheet.dart';

class LoginSignUpScreen extends ConsumerStatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  ConsumerState<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends ConsumerState<LoginSignUpScreen> {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final identifier = _identifierController.text.trim();
    final password = _passwordController.text;

    if (identifier.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/email and password'),
          backgroundColor: Color(0xFFF43F5E),
        ),
      );
      return;
    }

    FocusScope.of(context).unfocus();
    final authController = ref.read(authControllerProvider);
    final success = await authController.login(
      identifier: identifier,
      password: password,
    );

    if (!mounted) return;

    if (success) {
      if (context.mounted) {
        try {
          context.go('/');
        } catch (_) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      }
    } else {
      final error =
          authController.errorMessage ?? 'Login failed. Please check credentials.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }

  void _handleForgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Password reset link will be sent to your email.'),
      ),
    );
  }

  void _handleGoogleLogin() {
    SocialLoginModal.showGoogleAccountChooser(
      context: context,
      onAccountSelected: () => _completeSocialLogin(
        providerName: 'Google',
        providerCode: 'GOOGLE',
        token: 'sample-google-id-token',
      ),
    );
  }

  void _handleFacebookLogin() {
    SocialLoginModal.showFacebookLoginConfirm(
      context: context,
      onConfirm: () => _completeSocialLogin(
        providerName: 'Facebook',
        providerCode: 'FACEBOOK',
        token: 'sample-facebook-access-token',
      ),
    );
  }

  Future<void> _completeSocialLogin({
    required String providerName,
    required String providerCode,
    required String token,
  }) async {
    if (!mounted) return;
    SocialLoginModal.showLoadingDialog(context, providerName);

    final authController = ref.read(authControllerProvider);
    final success = await authController.socialLogin(
      provider: providerCode,
      token: token,
    );

    if (!mounted) return;
    Navigator.of(context, rootNavigator: true).pop();

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome! Successfully signed in with $providerName.'),
          backgroundColor: const Color(0xFF10B981),
        ),
      );

      if (mounted) {
        try {
          context.go('/');
        } catch (_) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      }
    } else {
      final error = authController.errorMessage ??
          'Failed to sign in with $providerName. Please try again.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final isLoading = auth.status == AuthStatus.signingIn;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 440,
                    height: 860,
                    child: Stack(
                      children: [
                        // Back Button
                        Positioned(
                          left: 14,
                          top: 14,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 20,
                              color: Color(0xFF0F172A),
                            ),
                            onPressed: () {
                              if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              } else {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OnboardingScreen(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),

                        // Login / Sign up Title
                        const Positioned(
                          left: 64,
                          top: 20,
                          child: Text(
                            'Login / Sign up',
                            style: TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 22,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -1.0,
                            ),
                          ),
                        ),

                        // Brand Logo
                        Positioned(
                          left: 183,
                          top: 95,
                          child: Container(
                            width: 74,
                            height: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage("assets/icons/logo.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        // Brand Name (COOBO)
                        const Positioned(
                          left: 0,
                          right: 0,
                          top: 173,
                          child: Center(
                            child: Text(
                              'COOBO',
                              style: TextStyle(
                                color: Color(0xFFF43F5E),
                                fontSize: 30,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),

                        // Identifier Field (Phone / Email / Username)
                        Positioned(
                          left: 34,
                          top: 222,
                          width: 372,
                          height: 52,
                          child: TextField(
                            controller: _identifierController,
                            enabled: !isLoading,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 16,
                              fontFamily: 'Inter',
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              hintText: 'Phone / Email /Username',
                              hintStyle: const TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                letterSpacing: -0.5,
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Color(0xFF94A3B8),
                                  size: 22,
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 44,
                                minHeight: 24,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xFFF43F5E),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xFFF43F5E),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Password Field
                        Positioned(
                          left: 34,
                          top: 282,
                          width: 372,
                          height: 52,
                          child: TextField(
                            controller: _passwordController,
                            enabled: !isLoading,
                            obscureText: !_showPassword,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _handleLogin(),
                            style: const TextStyle(
                              color: Color(0xFF0F172A),
                              fontSize: 16,
                              fontFamily: 'Inter',
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                letterSpacing: -0.5,
                              ),
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF94A3B8),
                                  size: 20,
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 44,
                                minHeight: 24,
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    splashRadius: 18,
                                    icon: Icon(
                                      _showPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: const Color(0xFF94A3B8),
                                      size: 20,
                                    ),
                                    onPressed: () => setState(
                                      () => _showPassword = !_showPassword,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: _handleForgotPassword,
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 14),
                                      child: Text(
                                        'Forgot?',
                                        style: TextStyle(
                                          color: Color(0xFF0EA5E9),
                                          fontSize: 15,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xFFF43F5E),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: Color(0xFFF43F5E),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Log In Button
                        Positioned(
                          left: 34,
                          top: 348,
                          child: GestureDetector(
                            onTap: isLoading ? null : _handleLogin,
                            child: Container(
                              width: 372,
                              height: 52,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: isLoading
                                    ? const Color(0xFFFDA4AF)
                                    : const Color(0xFFF43F5E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.5,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Text(
                                      'Log In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        // Log In with Phone Number
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 414,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Phone login: enter your phone number in the username field.',
                                    ),
                                                            ),
                                );
                              },
                              child: const Text(
                                'Log In with Phone Number',
                                style: TextStyle(
                                  color: Color(0xFF0EA5E9),
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // OR Divider
                        const Positioned(
                          left: 0,
                          right: 0,
                          top: 475,
                          child: Center(
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),

                        // Log In with Gmail
                        Positioned(
                          left: 34,
                          top: 528,
                          child: GestureDetector(
                            onTap: _handleGoogleLogin,
                            child: Container(
                              width: 372,
                              height: 52,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 1.50,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GoogleBrandIcon(size: 22),
                                    SizedBox(width: 10),
                                    Text(
                                      'Log In with Gmail',
                                      style: TextStyle(
                                        color: Color(0xFF151515),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Log In with Facebook
                        Positioned(
                          left: 34,
                          top: 588,
                          child: GestureDetector(
                            onTap: _handleFacebookLogin,
                            child: Container(
                              width: 372,
                              height: 52,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 1.50,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FacebookBrandIcon(size: 22),
                                    SizedBox(width: 10),
                                    Text(
                                      'Log In with Facebook',
                                      style: TextStyle(
                                        color: Color(0xFF151515),
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Don't have an account? Sign up
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 797,
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'Don’ t have an account? ',
                                style: const TextStyle(
                                  color: Color(0xFF151515),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.5,
                                ),
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(
                                          color: Color(0xFF0284C7),
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
