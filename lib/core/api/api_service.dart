import 'package:dio/dio.dart';
import 'package:frc_app/core/api/api_constants.dart';
import 'package:frc_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:frc_app/features/auth/forget_password/data/models/forget_password_response.dart';
import 'package:frc_app/features/auth/reset_password/data/models/reset_password_request.dart';
import 'package:frc_app/features/auth/reset_password/data/models/reset_password_response.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_response.dart';
import 'package:frc_app/features/auth/sign_in/data/models/verify_signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/verify_signin_response.dart';
import 'package:frc_app/features/auth/sign_up/data/models/signup_request.dart';
import 'package:frc_app/features/auth/sign_up/data/models/signup_response.dart';
import 'package:frc_app/features/auth/sign_up/data/models/verify_registration_request.dart';
import 'package:frc_app/features/auth/sign_up/data/models/verify_registration_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.register)
  Future<SignupResponse> register(@Body() SignupRequest request);

  @POST(ApiConstants.signInWithPhoneAndPassword)
  Future<SigninResponse> signIn(@Body() SigninRequest request);

  @POST(ApiConstants.sendForgetPasswordOtpViaWhatsApp)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest request,
  );
  @POST(ApiConstants.verifyPhoneOtpToCompleteRegesteration)
  Future<VerifyRegistrationResponse> verifyRegistration(
    @Body() VerifyRegistrationRequest request,
  );

  @POST(ApiConstants.verifyPhoneOtpToCompleteSignIn)
  Future<VerifySigninResponse> verifySignin(
    @Body() VerifySigninRequest request,
  );
  @POST(ApiConstants.verifyOtpAndResetPasswordViaMobile)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest request,
  );
}
