import 'package:frc_app/features/auth/shared/data/models/resend_otp_response.dart';
import 'package:frc_app/features/auth/shared/domain/repository/otp_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResendOtpUseCase {
  final ResendOtpRepository repository;

  ResendOtpUseCase(this.repository);

  Future<ResendOtpResponse> call(String phoneNumber) {
    return repository.resendOtp(phoneNumber);
  }
}
