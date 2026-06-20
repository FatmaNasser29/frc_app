import 'package:frc_app/features/auth/shared/data/models/resend_otp_response.dart';

abstract class ResendOtpRepository {
  Future<ResendOtpResponse> resendOtp(String phoneNumber);
}
