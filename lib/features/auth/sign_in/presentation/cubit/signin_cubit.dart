import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/core/errors/server_failure.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_request.dart';
import 'package:frc_app/features/auth/sign_in/domain/use_cases/signin_use_case.dart';
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  final SigninUseCase signinUseCase;

  SigninCubit(this.signinUseCase) : super(const SigninState());

  Future<void> signIn({required String phone, required String password}) async {
    emit(state.copyWith(status: SigninStatus.loading));

    try {
      final request = SigninRequest(phoneNumber: phone, password: password);

      debugPrint('Signin Request => ${request.toJson()}');

      final response = await signinUseCase(request);

      debugPrint('Access Token => ${response.accessToken}');

      debugPrint('Refresh Token => ${response.refreshToken}');

      emit(
        state.copyWith(status: SigninStatus.success, message: response.message),
      );
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioException(e);

      emit(
        state.copyWith(
          status: SigninStatus.error,
          errorMessage: failure.message,
        ),
      );
    }
  }
}
