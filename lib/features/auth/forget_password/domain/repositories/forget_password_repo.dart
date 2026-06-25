import 'package:frc_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:frc_app/features/auth/forget_password/data/models/forget_password_response.dart';

abstract class ForgetPasswordRepo {
  Future<ForgetPasswordResponse> sendOtp(ForgetPasswordRequest request);
}
