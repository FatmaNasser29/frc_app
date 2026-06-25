import 'package:frc_app/features/auth/sign_in/data/models/signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_response.dart';
import 'package:frc_app/features/auth/sign_in/domain/repositories/signin_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUseCase {
  final SigninRepo repo;

  SigninUseCase(this.repo);

  Future<SigninResponse> call(SigninRequest request) {
    return repo.signIn(request);
  }
}
