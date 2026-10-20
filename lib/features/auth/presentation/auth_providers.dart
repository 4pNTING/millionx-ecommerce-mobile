import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/network/network_providers.dart';
import '../data/datasources/auth_local_data_source.dart';
import '../data/datasources/auth_remote_data_source.dart';
import '../data/datasources/secure_auth_local_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/auth_repository.dart';
import '../domain/usecases/login_customer.dart';
import '../domain/usecases/logout.dart';
import '../domain/usecases/restore_session.dart';
import '../domain/usecases/register_customer.dart';
import '../domain/usecases/social_login_customer.dart';
import '../data/services/social_auth_service.dart';
import 'auth_controller.dart';

final socialAuthServiceProvider = Provider<SocialAuthService>(
  (ref) => FlutterSocialAuthService(),
);

final secureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>(
  (ref) => SecureAuthLocalDataSource(ref.watch(secureStorageProvider)),
);

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => GraphQlAuthRemoteDataSource(ref.watch(graphQlGatewayProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider),
  ),
);

final authControllerProvider = ChangeNotifierProvider<AuthController>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthController(
    LoginCustomer(repository),
    Logout(repository),
    RestoreSession(repository),
    RegisterCustomer(repository),
    SocialLoginCustomer(repository),
  );
});
