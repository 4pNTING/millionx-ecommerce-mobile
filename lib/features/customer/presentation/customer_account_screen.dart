import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/localization/language_provider.dart';
import '../../../core/widgets/store_scaffold.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../auth/presentation/auth_providers.dart';
import 'customer_providers.dart';

class CustomerAccountScreen extends ConsumerWidget {
  const CustomerAccountScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final strings = AppStrings.forLanguage(ref.watch(appLanguageProvider));
    if (auth.status == AuthStatus.restoreFailed) {
      return StoreScaffold(
        body: RetryPanel(
          message: strings.restoreError,
          label: strings.retry,
          onRetry: auth.restore,
        ),
      );
    }
    final session = auth.session;
    if (!auth.isSignedIn || session == null) {
      return const StoreScaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return StoreScaffold(
      body: ref
          .watch(customerProfileProvider(session.token))
          .when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => RetryPanel(
              message: error.toString(),
              label: strings.retry,
              onRetry: () =>
                  ref.invalidate(customerProfileProvider(session.token)),
            ),
            data: (profile) => Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    Text(
                      strings.account,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 24),
                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: Text(
                        [
                          profile.firstName,
                          profile.lastName,
                        ].whereType<String>().join(' '),
                      ),
                      subtitle: Text(profile.id),
                    ),
                    if (profile.email != null)
                      ListTile(
                        leading: const Icon(Icons.email_outlined),
                        title: Text(profile.email!),
                      ),
                    if (profile.phone != null)
                      ListTile(
                        leading: const Icon(Icons.phone_outlined),
                        title: Text(profile.phone!),
                      ),
                    const SizedBox(height: 24),
                    OutlinedButton(
                      onPressed: () async {
                        await auth.logout();
                      },
                      child: Text(strings.signOut),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
