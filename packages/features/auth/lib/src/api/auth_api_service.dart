import 'package:dio/dio.dart';
import 'package:networking/networking.dart';
import 'package:retrofit/retrofit.dart';

import '../../forget_password/data/models/forget_password_request.dart';
import '../../forget_password/data/models/forget_password_response.dart';
import '../../reset_password/data/models/reset_password_request.dart';
import '../../reset_password/data/models/reset_password_response.dart';
import '../../shared/resend_otp/data/models/resend_otp_request.dart';
import '../../shared/resend_otp/data/models/resend_otp_response.dart';
import '../../sign_in/data/models/signin_request.dart';
import '../../sign_in/data/models/signin_response.dart';
import '../../sign_in/data/models/verify_signin_request.dart';
import '../../sign_in/data/models/verify_signin_response.dart';
import '../../sign_up/data/models/signup_request.dart';
import '../../sign_up/data/models/signup_response.dart';
import '../../sign_up/data/models/verify_registration_request.dart';
import '../../sign_up/data/models/verify_registration_response.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

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
  @PATCH(ApiConstants.verifyOtpAndResetPasswordViaMobile)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest request,
  );
  @POST(ApiConstants.resendPhoneOtpViaWhatsApp)
  Future<ResendOtpResponse> resendOtp(@Body() ResendOtpRequest request);
}
