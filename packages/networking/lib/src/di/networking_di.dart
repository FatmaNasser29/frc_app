import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../api/logging_interceptor.dart';

void configureNetworkingDependencies(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(() {
    final config = getIt<AppConfig>();
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dioInstance.interceptors.add(LoggingInterceptor());
    return dioInstance;
  });
}
