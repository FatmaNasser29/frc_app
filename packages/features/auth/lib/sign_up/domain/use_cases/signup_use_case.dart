import 'package:auth/sign_up/data/models/signup_request.dart';
import 'package:auth/sign_up/data/models/signup_response.dart';
import 'package:auth/sign_up/domain/repositories/signup_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<SignupResponse> call(
    SignupRequest request,
  ) {
    return repository.register(request);
  }
}


