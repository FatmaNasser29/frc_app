import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'logging_interceptor.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(AppConfig config) {
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: config.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dioInstance.interceptors.add(LoggingInterceptor());
    return dioInstance;
  }
}