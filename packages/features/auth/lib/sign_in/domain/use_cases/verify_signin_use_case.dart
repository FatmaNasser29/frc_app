import 'package:auth/sign_in/data/models/verify_signin_request.dart';
import 'package:auth/sign_in/data/models/verify_signin_response.dart';
import 'package:auth/sign_in/domain/repositories/signin_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifySigninUseCase {
  final SigninRepo repo;

  VerifySigninUseCase(this.repo);

  Future<VerifySigninResponse> call(VerifySigninRequest request) {
    return repo.verifySignin(request);
  }
}
