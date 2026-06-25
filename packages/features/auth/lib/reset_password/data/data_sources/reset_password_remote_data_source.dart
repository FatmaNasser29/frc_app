import '../models/reset_password_request.dart';
import '../models/reset_password_response.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
}
