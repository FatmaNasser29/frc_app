import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth/shared/resend_otp/domain/usecases/resend_otp_usecase.dart';
import 'package:auth/shared/resend_otp/presentation/cubit/resend_otp_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResendOtpCubit extends Cubit<ResendOtpState> {
  final ResendOtpUseCase useCase;

  ResendOtpCubit(this.useCase) : super(const ResendOtpState());

  Future<void> resendOtp(String phoneNumber) async {
    try {
      emit(state.copyWith(resendStatus: ResendOtpStatus.loading));

      final response = await useCase(phoneNumber);

      emit(
        state.copyWith(
          resendStatus: ResendOtpStatus.success,
          message: response.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          resendStatus: ResendOtpStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
