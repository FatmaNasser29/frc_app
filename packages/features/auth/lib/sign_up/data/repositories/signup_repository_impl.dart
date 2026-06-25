import 'package:auth/sign_up/data/data_sources/signup_remote_data_source.dart';
import 'package:auth/sign_up/data/models/signup_request.dart';
import 'package:auth/sign_up/data/models/signup_response.dart';
import 'package:auth/sign_up/data/models/verify_registration_request.dart';
import 'package:auth/sign_up/data/models/verify_registration_response.dart';
import 'package:auth/sign_up/domain/repositories/signup_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRepository)
class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDataSource remote;

  SignupRepositoryImpl(this.remote);

  @override
  Future<SignupResponse> register(SignupRequest request) {
    return remote.register(request);
  }

  @override
  Future<VerifyRegistrationResponse> verifyRegistration(
    VerifyRegistrationRequest request,
  ) {
    return remote.verifyRegistration(request);
  }
}
