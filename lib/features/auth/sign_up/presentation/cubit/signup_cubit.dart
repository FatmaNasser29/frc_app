import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/core/errors/failures.dart';
import 'package:frc_app/core/errors/server_failure.dart';
import 'package:frc_app/features/auth/sign_up/data/models/signup_request.dart';
import 'package:frc_app/features/auth/sign_up/domain/use_cases/signup_use_case.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase) : super(const SignupState());

  Future<void> register({
    required String fullName,
    required String phone,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: SignupStatus.loading,
        errorMessage: null,
        message: null,
      ),
    );

    try {
      final request = SignupRequest(
        fullName: fullName,
        phoneNumber: phone,
        password: password,
      );

      debugPrint('Signup Request => ${request.toJson()}');

      final response = await signupUseCase(request);

      debugPrint('Signup Success Response => ${response.toJson()}');

      debugPrint('Success Message => ${response.message}');

      emit(
        state.copyWith(status: SignupStatus.success, message: response.message),
      );
    } on DioException catch (e) {
      debugPrint('Status Code => ${e.response?.statusCode}');

      debugPrint('Error Response => ${e.response?.data}');

      final failure = ServerFailure.fromDioException(e);

      emit(
        state.copyWith(
          status: SignupStatus.error,
          errorMessage: failure.message,
        ),
      );
    } on Failure catch (e) {
      debugPrint('Failure => ${e.message}');

      emit(state.copyWith(status: SignupStatus.error, errorMessage: e.message));
    } catch (e) {
      debugPrint('Unexpected Error => $e');

      emit(
        state.copyWith(
          status: SignupStatus.error,
          errorMessage: 'Something went wrong',
        ),
      );
    }
  }
}
