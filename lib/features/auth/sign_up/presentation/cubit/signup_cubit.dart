import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frc_app/features/auth/sign_up/data/models/signup_request.dart';
import 'package:frc_app/features/auth/sign_up/domain/use_cases/signup_use_case.dart';
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase)
      : super(const SignupState());

  Future<void> register({
    required String fullName,
    required String phone,
    required String password,
  }) async {
    emit(
      state.copyWith(
        status: SignupStatus.loading,
      ),
    );

    try {
final request = SignupRequest(
  fullName: fullName,
  phoneNumber: phone,
  password: password,
);

debugPrint(request.toJson().toString());

final response = await signupUseCase(request);

      emit(
        state.copyWith(
          status: SignupStatus.success,
          message: response.message,
        ),
      );
  
} on DioException catch (e) {
  debugPrint(
    'Error Response: ${e.response?.data}',
  );

  emit(
    state.copyWith(
      status: SignupStatus.error,
      errorMessage:
          e.response?.data.toString() ??
          e.message,
    ),
  );
}
  }
}
