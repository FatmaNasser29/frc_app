import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:dio/dio.dart';
import '../api/auth_api_service.dart';

import 'auth_di.config.dart';

@InjectableInit(
  initializerName: 'initAuth',
  preferRelativeImports: true,
  asExtension: false,
)
void configureAuthDependencies(GetIt getIt) {
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(getIt<Dio>()));
  initAuth(getIt);
}
