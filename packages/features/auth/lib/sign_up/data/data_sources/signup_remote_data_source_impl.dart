import '../../../src/api/auth_api_service.dart';
import 'package:auth/sign_up/data/data_sources/signup_remote_data_source.dart';
import 'package:auth/sign_up/data/models/signup_request.dart';
import 'package:auth/sign_up/data/models/signup_response.dart';
import 'package:auth/sign_up/data/models/verify_registration_request.dart';
import 'package:auth/sign_up/data/models/verify_registration_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRemoteDataSource)
class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final AuthApiService apiService;

  SignupRemoteDataSourceImpl(this.apiService);

  @override
  Future<SignupResponse> register(SignupRequest request) {
    return apiService.register(request);
  }

  @override
  Future<VerifyRegistrationResponse> verifyRegistration(
    VerifyRegistrationRequest request,
  ) {
    return apiService.verifyRegistration(request);
  }
}
