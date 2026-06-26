import 'package:auth/reset_password/data/models/reset_password_request.dart';
import 'package:auth/reset_password/data/models/reset_password_response.dart';
import 'package:auth/reset_password/data/repositories/reset_password_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ResetPasswordRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<ResetPasswordResponse> call(ResetPasswordRequest request) {
    return repository.resetPassword(request);
  }
}
