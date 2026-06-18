import 'package:frc_app/features/auth/sign_in/data/models/signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_response.dart';

abstract class SigninRepo {
  Future<SigninResponse> signIn(SigninRequest request);
}
