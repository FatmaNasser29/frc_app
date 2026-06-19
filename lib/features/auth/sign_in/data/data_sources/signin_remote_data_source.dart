import 'package:frc_app/features/auth/sign_in/data/models/signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_response.dart';
import 'package:frc_app/features/auth/sign_in/data/models/verify_signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/verify_signin_response.dart';

abstract class SigninRemoteDataSource {
  Future<SigninResponse> signIn(SigninRequest request);
  Future<VerifySigninResponse> verifySignin(VerifySigninRequest request);
}
