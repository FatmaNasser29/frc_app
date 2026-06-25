import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking/networking.dart';
import 'package:auth/reset_password/data/models/reset_password_request.dart';
import 'package:auth/reset_password/domain/use_cases/reset_password_use_case.dart';
import 'package:auth/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase useCase;

  ResetPasswordCubit(this.useCase) : super(const ResetPasswordState());

  Future<void> resetPassword({
    required String phoneNumber,
    required String otp,
    required String password,
    required String confirmPassword,
  }) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    try {
      debugPrint('Phone => $phoneNumber');
      debugPrint('OTP => $otp');
      debugPrint('Password => $password');
      final response = await useCase(
        ResetPasswordRequest(
          phoneNumber: phoneNumber,
          otp: otp,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );

      emit(
        state.copyWith(
          status: ResetPasswordStatus.success,
          message: response.message,
        ),
      );
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioException(e);
      debugPrint('Status Code => ${e.response?.statusCode}');
      debugPrint('Response => ${e.response?.data}');
      emit(
        state.copyWith(
          status: ResetPasswordStatus.error,
          errorMessage: failure.message,
        ),
      );
    }
  }
}
