import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../localization/app_strings.dart';
import '../localization/language_provider.dart';
import '../localization/store_strings.dart';
import '../../features/auth/presentation/auth_providers.dart';

class StoreScaffold extends ConsumerWidget {
  const StoreScaffold({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appLanguageProvider);
    final auth = ref.watch(authControllerProvider);
    final strings = StoreStrings(language);
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () => context.go('/'),
          child: const Text(
            'MillionX Store',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        actions: [
          PopupMenuButton<AppLanguage>(
            tooltip: 'Language / ພາສາ',
            icon: const Icon(Icons.language),
            onSelected: (value) =>
                ref.read(appLanguageProvider.notifier).state = value,
            itemBuilder: (_) => const [
              PopupMenuItem(value: AppLanguage.english, child: Text('English')),
              PopupMenuItem(value: AppLanguage.lao, child: Text('ລາວ')),
            ],
          ),
          TextButton.icon(
            onPressed: () =>
                context.go(auth.isSignedIn ? '/account' : '/login'),
            icon: const Icon(Icons.person_outline),
            label: Text(
              auth.isSignedIn
                  ? strings.account
                  : AppStrings.forLanguage(language).signIn,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(child: body),
    );
  }
}

class RetryPanel extends StatelessWidget {
  const RetryPanel({
    super.key,
    required this.message,
    required this.label,
    required this.onRetry,
  });
  final String message;
  final String label;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off_outlined, size: 48),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton(onPressed: onRetry, child: Text(label)),
        ],
      ),
    ),
  );
}
