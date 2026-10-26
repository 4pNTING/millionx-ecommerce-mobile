import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/auth_controller.dart';
import '../features/auth/presentation/auth_providers.dart';
import '../features/auth/presentation/login_sign_up_screen.dart';
import '../features/auth/presentation/onboarding_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/category/presentation/category_screen.dart';
import '../features/customer/presentation/customer_account_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/home/presentation/search_result_screen.dart';
import '../features/home/presentation/search_screen.dart';
import '../features/product/presentation/product_detail_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.read(authControllerProvider);
  final router = GoRouter(
    initialLocation: '/',
    refreshListenable: auth,
    redirect: (context, state) {
      final location = state.matchedLocation;
      if (location == '/account' && auth.status == AuthStatus.signedOut) {
        return '/login';
      }
      if (auth.isSignedIn &&
          (location == '/login' ||
              location == '/register' ||
              location == '/login-signup')) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginSignUpScreen(),
      ),
      GoRoute(
        path: '/login-signup',
        builder: (context, state) => const LoginSignUpScreen(),
      ),
      GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        name: 'search-results',
        path: '/search-results',
        builder: (context, state) => SearchResultScreen(
          query: state.uri.queryParameters['q'] ?? '',
        ),
      ),
      GoRoute(
        path: '/products/:id',
        builder: (context, state) =>
            ProductDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoryScreen(),
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
