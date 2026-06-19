import 'package:frc_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:frc_app/features/auth/forget_password/data/models/forget_password_response.dart';
import 'package:frc_app/features/auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepo repo;

  ForgetPasswordUseCase(this.repo);

  Future<ForgetPasswordResponse> call(ForgetPasswordRequest request) {
    return repo.sendOtp(request);
  }
}
