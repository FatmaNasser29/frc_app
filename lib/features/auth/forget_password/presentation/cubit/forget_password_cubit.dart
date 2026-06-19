import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/core/errors/server_failure.dart';
import 'package:frc_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:frc_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase useCase;

  ForgetPasswordCubit(this.useCase) : super(const ForgetPasswordState());

  Future<void> sendOtp({required String phone}) async {
    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    try {
      final response = await useCase(ForgetPasswordRequest(phoneNumber: phone));

      emit(
        state.copyWith(
          status: ForgetPasswordStatus.success,
          message: response.message,
        ),
      );
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioException(e);

      emit(
        state.copyWith(
          status: ForgetPasswordStatus.error,
          errorMessage: failure.message,
        ),
      );
    }
  }
}
