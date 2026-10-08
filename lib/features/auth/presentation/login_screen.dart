import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localization/app_strings.dart';
import '../../../core/localization/language_provider.dart';
import '../../../core/localization/store_strings.dart';
import 'auth_controller.dart';
import 'auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _identifier = TextEditingController();
  final _password = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _identifier.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await ref
        .read(authControllerProvider)
        .login(identifier: _identifier.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final language = ref.watch(appLanguageProvider);
    final strings = AppStrings.forLanguage(language);
    final loading = auth.status == AuthStatus.signingIn;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 900;
            return Row(
              children: [
                if (wide) const Expanded(flex: 5, child: _BrandPanel()),
                Expanded(
                  flex: wide ? 4 : 1,
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 430),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const _BrandName(),
                                  PopupMenuButton<AppLanguage>(
                                    tooltip: 'Language / ພາສາ',
                                    initialValue: language,
                                    onSelected: (value) =>
                                        ref
                                                .read(
                                                  appLanguageProvider.notifier,
                                                )
                                                .state =
                                            value,
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(
                                        value: AppLanguage.english,
                                        child: Text('English'),
                                      ),
                                      PopupMenuItem(
                                        value: AppLanguage.lao,
                                        child: Text('ລາວ'),
                                      ),
                                    ],
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        language == AppLanguage.lao
                                            ? 'ລາວ ▾'
                                            : 'EN ▾',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 44),
                              Text(
                                strings.loginTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                strings.loginSubtitle,
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(color: Colors.black54),
                              ),
                              const SizedBox(height: 32),
                              if (auth.errorMessage != null) ...[
                                MaterialBanner(
                                  content: Text(auth.errorMessage!),
                                  actions: [
                                    TextButton(
                                      onPressed: auth.clearError,
                                      child: const Text('×'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                              ],
                              TextFormField(
                                controller: _identifier,
                                enabled: !loading,
                                textInputAction: TextInputAction.next,
                                autofillHints: const [AutofillHints.username],
                                decoration: InputDecoration(
                                  labelText: strings.identifier,
                                  prefixIcon: const Icon(Icons.person_outline),
                                ),
                                onChanged: (_) => auth.clearError(),
                                validator: (value) =>
                                    (value ?? '').trim().isEmpty
                                    ? strings.identifierRequired
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _password,
                                enabled: !loading,
                                obscureText: !_showPassword,
                                textInputAction: TextInputAction.done,
                                autofillHints: const [AutofillHints.password],
                                decoration: InputDecoration(
                                  labelText: strings.password,
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    tooltip: _showPassword
                                        ? 'Hide password'
                                        : 'Show password',
                                    onPressed: () => setState(
                                      () => _showPassword = !_showPassword,
                                    ),
                                    icon: Icon(
                                      _showPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                  ),
                                ),
                                onChanged: (_) => auth.clearError(),
                                onFieldSubmitted: (_) => _submit(),
                                validator: (value) => (value ?? '').isEmpty
                                    ? strings.passwordRequired
                                    : null,
                              ),
                              const SizedBox(height: 28),
                              FilledButton(
                                onPressed: loading ? null : _submit,
                                style: FilledButton.styleFrom(
                                  minimumSize: const Size.fromHeight(52),
                                ),
                                child: loading
                                    ? const SizedBox.square(
                                        dimension: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(strings.signIn),
                              ),
                              TextButton(
                                onPressed: loading
                                    ? null
                                    : () => context.go('/register'),
                                child: Text(StoreStrings(language).register),
                              ),
                              TextButton(
                                onPressed: () => context.go('/'),
                                child: Text(StoreStrings(language).products),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _BrandName extends StatelessWidget {
  const _BrandName();

  @override
  Widget build(BuildContext context) => Text(
    'MillionX',
    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w800,
      color: const Color(0xFF685DD8),
    ),
  );
}

class _BrandPanel extends StatelessWidget {
  const _BrandPanel();

  @override
  Widget build(BuildContext context) => Container(
    color: const Color(0xFFF3F0FF),
    padding: const EdgeInsets.all(64),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _BrandName(),
        const Spacer(),
        const Icon(
          Icons.shopping_bag_outlined,
          size: 180,
          color: Color(0xFF685DD8),
        ),
        const SizedBox(height: 24),
        Text(
          'MillionX Store',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: const Color(0xFF342E59),
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}
