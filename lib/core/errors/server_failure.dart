import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
        debugPrint('Status Code => ${exception.response?.statusCode}');
        debugPrint('Error Response => ${exception.response?.data}');

        return ServerFailure.fromResponse(
          exception.response?.statusCode,
          exception.response?.data,
        );

      case DioExceptionType.unknown:
        return const ServerFailure('Unexpected error occurred');
    }
  }

  static String _extractMessage(dynamic response, String fallback) {
    final message = response?['message'];

    if (message is String) {
      return message;
    }

    if (message is List) {
      return message.join(', ');
    }

    if (message is Map) {
      return message.values.first.toString();
    }

    return fallback;
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    final message = response?['message'];

    String errorMessage;

    if (message is String) {
      errorMessage = message;
    } else if (message is List) {
      errorMessage = message.join(', ');
    } else {
      errorMessage = 'Something went wrong';
    }

    switch (statusCode) {
      case 400:
        return ServerFailure(errorMessage);

      case 401:
        return ServerFailure(errorMessage);

      case 403:
        return ServerFailure(errorMessage);

      case 404:
        return ServerFailure(errorMessage);
      case 429:
        return ServerFailure(
          _extractMessage(
            response,
            'Too many requests. Please try again later.',
          ),
        );
      case 500:
        return const ServerFailure('Internal server error');

      default:
        return ServerFailure(errorMessage);
    }
  }
}
