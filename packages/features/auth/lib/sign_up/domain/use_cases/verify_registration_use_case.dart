import 'package:auth/sign_up/data/models/verify_registration_request.dart';
import 'package:auth/sign_up/data/models/verify_registration_response.dart';
import 'package:auth/sign_up/domain/repositories/signup_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyRegistrationUseCase {
  final SignupRepository repository;

  VerifyRegistrationUseCase(this.repository);

  Future<VerifyRegistrationResponse> call(VerifyRegistrationRequest request) {
    return repository.verifyRegistration(request);
  }
}
