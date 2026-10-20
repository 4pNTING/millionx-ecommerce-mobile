import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/localization/language_provider.dart';
import '../../../core/localization/store_strings.dart';
import '../../../core/widgets/store_scaffold.dart';
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
  @override
  void dispose() {
    for (final field in [
      _firstName,
      _lastName,
      _email,
      _phone,
      _password,
      _confirmation,
    ]) {
      field.dispose();
    }
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_form.currentState?.validate() ?? false)) return;
    await ref
        .read(authControllerProvider)
        .register(
          CustomerRegistration(
            firstName: _firstName.text,
            lastName: _lastName.text,
            email: _email.text,
            phone: _phone.text,
            password: _password.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final strings = StoreStrings(ref.watch(appLanguageProvider));
    final auth = ref.watch(authControllerProvider);
    final loading = auth.status == AuthStatus.signingIn;
    return StoreScaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    strings.register,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24),
                  if (auth.errorMessage != null) ...[
                    Text(
                      auth.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                  ],
                  for (final item in [
                    (strings.firstName, _firstName),
                    (strings.lastName, _lastName),
                  ]) ...[
                    TextFormField(
                      controller: item.$2,
                      enabled: !loading,
                      decoration: InputDecoration(labelText: item.$1),
                    ),
                    const SizedBox(height: 16),
                  ],
                  TextFormField(
                    controller: _email,
                    enabled: !loading,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: strings.email),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phone,
                    enabled: !loading,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: strings.phone),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _password,
                    enabled: !loading,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: strings.text('Password', 'ລະຫັດຜ່ານ'),
                    ),
                    validator: (value) =>
                        (value ?? '').length < 8 || (value ?? '').length > 72
                        ? strings.text(
                            'Use 8–72 characters',
                            'ໃຊ້ 8–72 ຕົວອັກສອນ',
                          )
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _confirmation,
                    enabled: !loading,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: strings.text(
                        'Confirm password',
                        'ຢືນຢັນລະຫັດຜ່ານ',
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
                  FilledButton(
                    onPressed: loading ? null : _submit,
                    child: loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(strings.register),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
