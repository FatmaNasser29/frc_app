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
    if (response == null) return fallback;

    // Check for "errors" object first (standard validation layout)
    final errors = response['errors'];
    if (errors != null) {
      if (errors is String) {
        return errors;
      }
      if (errors is List) {
        return errors.join(', ');
      }
      if (errors is Map) {
        final allErrors = <String>[];
        for (final value in errors.values) {
          if (value is List) {
            allErrors.add(value.join(', '));
          } else if (value != null) {
            allErrors.add(value.toString());
          }
        }
        if (allErrors.isNotEmpty) {
          return allErrors.join('\n');
        }
      }
    }

    final message = response['message'];
    if (message != null) {
      if (message is String) {
        return message;
      }
      if (message is List) {
        return message.join(', ');
      }
      if (message is Map) {
        final allMessages = <String>[];
        for (final value in message.values) {
          if (value is List) {
            allMessages.add(value.join(', '));
          } else if (value != null) {
            allMessages.add(value.toString());
          }
        }
        if (allMessages.isNotEmpty) {
          return allMessages.join('\n');
        }
      }
    }

    return fallback;
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    final errorMessage = _extractMessage(response, 'Something went wrong');

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
