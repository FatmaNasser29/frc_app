import 'package:dio/dio.dart';
import 'package:frc_app/core/api/logging_interceptor.dart';
import 'package:injectable/injectable.dart';

import 'api_constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dioInstance = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dioInstance.interceptors.add(LoggingInterceptor());
    return dioInstance;
  }
}