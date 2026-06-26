import 'package:auth/shared/resend_otp/data/models/resend_otp_response.dart';
import 'package:auth/shared/resend_otp/domain/repository/resend_otp_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResendOtpUseCase {
  final ResendOtpRepository repository;

  ResendOtpUseCase(this.repository);

  Future<ResendOtpResponse> call(String phoneNumber) {
    return repository.resendOtp(phoneNumber);
  }
}
