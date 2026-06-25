import 'package:auth/reset_password/data/models/reset_password_request.dart';
import 'package:auth/reset_password/data/models/reset_password_response.dart';

abstract class ResetPasswordRepository {
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
}
