import 'package:dio/dio.dart';
import 'package:frc_app/core/api/api_service.dart';
import 'package:injectable/injectable.dart';


@module
abstract class NetworkModule {
  @lazySingleton
  ApiService provideApiService(
    Dio dio,
  ) =>
      ApiService(dio);
}