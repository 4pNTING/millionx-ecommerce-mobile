import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/auth_controller.dart';
import '../features/auth/presentation/auth_providers.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/customer/presentation/customer_account_screen.dart';
import '../features/home/presentation/storefront_screen.dart';
import '../features/product/presentation/product_detail_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.read(authControllerProvider);
  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: auth,
    redirect: (context, state) {
      final location = state.matchedLocation;
      // Catalog stays public even when restoring a session fails.
      if (location == '/account' && auth.status == AuthStatus.signedOut) {
        return '/login';
      }
      if (auth.isSignedIn &&
          (location == '/login' || location == '/register')) {
        return '/account';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const StorefrontScreen()),
      GoRoute(
        path: '/products/:id',
        builder: (context, state) =>
            ProductDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => const CustomerAccountScreen(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
