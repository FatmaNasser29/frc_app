import 'package:frc_app/features/auth/sign_up/data/models/signup_request.dart';
import 'package:frc_app/features/auth/sign_up/data/models/signup_response.dart';

abstract class SignupRepository {
  Future<SignupResponse> register(
    SignupRequest request,
  );
}