import 'package:auth/sign_up/data/models/signup_request.dart';
import 'package:auth/sign_up/data/models/signup_response.dart';
import 'package:auth/sign_up/data/models/verify_registration_request.dart';
import 'package:auth/sign_up/data/models/verify_registration_response.dart';

abstract class SignupRemoteDataSource {
  Future<SignupResponse> register(SignupRequest request);
  Future<VerifyRegistrationResponse> verifyRegistration(
    VerifyRegistrationRequest request,
  );
}
