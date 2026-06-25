import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/core/errors/failures.dart';
import 'package:frc_app/core/errors/server_failure.dart';
import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_local_data_source.dart';
import 'package:frc_app/features/auth/sign_up/data/models/signup_request.dart';
import 'package:frc_app/features/auth/sign_up/data/models/verify_registration_request.dart';
import 'package:frc_app/features/auth/sign_up/domain/use_cases/signup_use_case.dart';
import 'package:frc_app/features/auth/sign_up/domain/use_cases/verify_registration_use_case.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;
  final VerifyRegistrationUseCase verifyRegistrationUseCase;
  final SigninLocalDataSource localDataSource;

  SignupCubit(
    this.signupUseCase,
    this.verifyRegistrationUseCase,
    this.localDataSource,
  ) : super(const SignupState());

  Future<void> register({
    required String fullName,
    required String phone,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: SignupStatus.loading,
        message: null,
        errorMessage: null,
      ),
    );

    try {
      final request = SignupRequest(
        fullName: fullName,
        phoneNumber: phone,
        password: password,
      );
      debugPrint('Before API');
      final response = await signupUseCase(request);
      debugPrint('After API');
      emit(
        state.copyWith(status: SignupStatus.success, message: response.message),
      );
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioException(e);

      emit(
        state.copyWith(
          status: SignupStatus.error,
          errorMessage: failure.message,
        ),
      );
    } on Failure catch (e) {
      emit(state.copyWith(status: SignupStatus.error, errorMessage: e.message));
    } catch (_) {
      emit(
        state.copyWith(
          status: SignupStatus.error,
          errorMessage: 'Something went wrong',
        ),
      );
    }
  }

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    emit(
      state.copyWith(status: SignupStatus.verifyLoading, errorMessage: null),
    );

    try {
      final response = await verifyRegistrationUseCase(
        VerifyRegistrationRequest(phoneNumber: phoneNumber, otp: otp),
      );
      debugPrint('Verify Success => ${response.message}');

      await localDataSource.saveAccessToken(response.accessToken);

      await localDataSource.saveRefreshToken(response.refreshToken);

      emit(
        state.copyWith(
          status: SignupStatus.verifySuccess,
          message: response.message,
        ),
      );
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioException(e);

      emit(
        state.copyWith(
          status: SignupStatus.verifyError,
          errorMessage: failure.message,
        ),
      );
    } on Failure catch (e) {
      emit(
        state.copyWith(
          status: SignupStatus.verifyError,
          errorMessage: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: SignupStatus.verifyError,
          errorMessage: 'Something went wrong',
        ),
      );
    }
  }
}
