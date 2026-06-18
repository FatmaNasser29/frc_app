import 'package:dio/dio.dart';
import 'package:frc_app/core/errors/failures.dart';

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout');

      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout');

      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate');

      case DioExceptionType.cancel:
        return const ServerFailure('Request cancelled');

      case DioExceptionType.connectionError:
        return const ServerFailure('No internet connection');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          exception.response?.statusCode,
          exception.response?.data,
        );

      case DioExceptionType.unknown:
        return const ServerFailure('Unexpected error occurred');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure(response['message'] ?? 'Bad request');

      case 401:
        return ServerFailure(response['message'] ?? 'Unauthorized');

      case 403:
        return ServerFailure(response['message'] ?? 'Forbidden');

      case 404:
        return ServerFailure(response['message'] ?? 'Not found');

      case 500:
        return const ServerFailure('Internal server error');

      default:
        return const ServerFailure('Something went wrong');
    }
  }
}
