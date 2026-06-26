import 'package:auth/shared/resend_otp/data/models/resend_otp_response.dart';

abstract class ResendOtpRemoteDatasource {
  Future<ResendOtpResponse> resendOtp(String phoneNumber);
}
