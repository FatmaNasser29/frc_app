import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('🚀 [API REQUEST] ${options.method} ${options.uri}');
    if (options.queryParameters.isNotEmpty) {
      debugPrint('   Query Params: ${options.queryParameters}');
    }
    if (options.data != null) {
      debugPrint('   Body: ${options.data}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '✅ [API RESPONSE SUCCESS - ${response.statusCode}] ${response.requestOptions.method} ${response.requestOptions.uri}');
    if (response.data != null) {
      debugPrint('   Response Data: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final statusCodeStr = response?.statusCode != null ? ' - ${response!.statusCode}' : '';
    debugPrint(
        '❌ [API RESPONSE FAILURE$statusCodeStr] ${err.requestOptions.method} ${err.requestOptions.uri}');
    debugPrint('   Error Message: ${err.message}');
    if (response?.data != null) {
      debugPrint('   Response Error Data: ${response?.data}');
    }
    super.onError(err, handler);
  }
}
