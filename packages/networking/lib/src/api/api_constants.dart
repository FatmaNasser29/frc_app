class ApiConstants {
  static const String register = 'auth/phone/register';
  static const String signInWithPhoneAndPassword = 'auth/phone/login';
  static const String sendForgetPasswordOtpViaWhatsApp =
      'auth/phone/password/forgot';
  static const String verifyOtpAndResetPasswordViaMobile =
      'auth/phone/password/reset';
  static const String verifyPhoneOtpToCompleteRegesteration =
      'auth/phone/verify-registration';
  static const String verifyPhoneOtpToCompleteSignIn =
      'auth/phone/verify-login';
  static const String resendPhoneOtpViaWhatsApp = 'auth/phone/resend-otp';
}
