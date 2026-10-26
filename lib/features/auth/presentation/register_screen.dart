import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/language_provider.dart';
import '../../../core/localization/store_strings.dart';
import '../domain/customer_registration.dart';
import 'auth_controller.dart';
import 'auth_providers.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmation = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmation.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_form.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();

    final authController = ref.read(authControllerProvider);
    final success = await authController.register(
      CustomerRegistration(
        firstName: _firstName.text.trim(),
        lastName: _lastName.text.trim(),
        email: _email.text.trim(),
        phone: _phone.text.trim(),
        password: _password.text,
      ),
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully! Welcome.'),
          backgroundColor: Color(0xFF10B981),
        ),
      );
      if (context.mounted) {
        try {
          context.go('/');
        } catch (_) {
          Navigator.of(context).pop();
        }
      }
    } else {
      final error = authController.errorMessage ?? 'Registration failed. Please try again.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }

  void _handleBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      try {
        context.go('/login');
      } catch (_) {
        context.go('/');
      }
    }
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF94A3B8),
        fontSize: 15,
        fontFamily: 'Inter',
        letterSpacing: -0.3,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Icon(prefixIcon, color: const Color(0xFF94A3B8), size: 20),
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 44, minHeight: 24),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFF43F5E), width: 1.8),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1.2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = StoreStrings(ref.watch(appLanguageProvider));
    final auth = ref.watch(authControllerProvider);
    final loading = auth.status == AuthStatus.signingIn;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Top Bar with Back Button & Title
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Color(0xFF0F172A),
                          ),
                          onPressed: _handleBack,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          strings.register,
                          style: const TextStyle(
                            color: Color(0xFF0F172A),
                            fontSize: 22,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Brand Logo
                    Center(
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage("assets/icons/logo.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Brand Name
                    const Center(
                      child: Text(
                        'COOBO',
                        style: TextStyle(
                          color: Color(0xFFF43F5E),
                          fontSize: 26,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Subtitle
                    Center(
                      child: Text(
                        strings.text(
                          'Create your customer account to start shopping',
                          'ສ້າງບັນຊີຂອງທ່ານເພື່ອເລີ່ມຕົ້ນການຊື້ເຄື່ອງ',
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Error Banner if any
                    if (auth.errorMessage != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFFCA5A5)),
                        ),
                        child: Text(
                          auth.errorMessage!,
                          style: const TextStyle(
                            color: Color(0xFFDC2626),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // First Name & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstName,
                            enabled: !loading,
                            textInputAction: TextInputAction.next,
                            decoration: _inputDecoration(
                              hintText: strings.firstName,
                              prefixIcon: Icons.person_outline,
                            ),
                            validator: (val) {
                              if ((val ?? '').trim().isEmpty) {
                                return strings.text('Required', 'ຈຳເປັນ');
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _lastName,
                            enabled: !loading,
                            textInputAction: TextInputAction.next,
                            decoration: _inputDecoration(
                              hintText: strings.lastName,
                              prefixIcon: Icons.person_outline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Email Field
                    TextFormField(
                      controller: _email,
                      enabled: !loading,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: _inputDecoration(
                        hintText: strings.email,
                        prefixIcon: Icons.mail_outline,
                      ),
                      validator: (value) {
                        final email = (value ?? '').trim();
                        if (email.isEmpty && _phone.text.trim().isEmpty) {
                          return strings.text(
                            'Enter email or phone',
                            'ປ້ອນອີເມວ ຫຼື ເບີໂທ',
                          );
                        }
                        if (email.isNotEmpty &&
                            !RegExp(
                              r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                            ).hasMatch(email)) {
                          return strings.text('Invalid email', 'ອີເມວບໍ່ຖືກຕ້ອງ');
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    // Phone Field
                    TextFormField(
                      controller: _phone,
                      enabled: !loading,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: _inputDecoration(
                        hintText: strings.phone,
                        prefixIcon: Icons.phone_outlined,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Password Field
                    TextFormField(
                      controller: _password,
                      enabled: !loading,
                      obscureText: !_showPassword,
                      textInputAction: TextInputAction.next,
                      decoration: _inputDecoration(
                        hintText: strings.text('Password (8+ chars)', 'ລະຫັດຜ່ານ (8+ ຕົວ)'),
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF94A3B8),
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) =>
                          (value ?? '').length < 8 || (value ?? '').length > 72
                              ? strings.text(
                                  'Use 8–72 characters',
                                  'ໃຊ້ 8–72 ຕົວອັກສອນ',
                                )
                              : null,
                    ),
                    const SizedBox(height: 14),

                    // Confirm Password Field
                    TextFormField(
                      controller: _confirmation,
                      enabled: !loading,
                      obscureText: !_showConfirmPassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(),
                      decoration: _inputDecoration(
                        hintText: strings.text(
                          'Confirm Password',
                          'ຢືນຢັນລະຫັດຜ່ານ',
                        ),
                        prefixIcon: Icons.lock_reset_outlined,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF94A3B8),
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _showConfirmPassword = !_showConfirmPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) => value != _password.text
                          ? strings.text(
                              'Passwords do not match',
                              'ລະຫັດຜ່ານບໍ່ກົງກັນ',
                            )
                          : null,
                    ),
                    const SizedBox(height: 24),

                    // Submit Button
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF43F5E),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: loading ? null : _submit,
                        child: loading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                strings.register,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Bottom Link to Sign In
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: strings.text(
                            'Already have an account? ',
                            'ມີບັນຊີແລ້ວບໍ? ',
                          ),
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 14,
                            fontFamily: 'Inter',
                          ),
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: GestureDetector(
                                onTap: _handleBack,
                                child: Text(
                                  strings.text('Sign in', 'ເຂົ້າສູ່ລະບົບ'),
                                  style: const TextStyle(
                                    color: Color(0xFFF43F5E),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
