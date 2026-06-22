// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FRC App';

  @override
  String get fashionIndustryNetwork => 'The Fashion Industry Network';

  @override
  String get fashionAndBeauty => 'Fashion & Beauty';

  @override
  String get connectWithProfessionalsLocally =>
      'Connect with top professionals locally';

  @override
  String get chooseSignInOptionTitle => 'Choose Your Best\n Sign in Option';

  @override
  String get signWithGoogle => 'Sign With Google';

  @override
  String get signWithLinkedin => 'Sign With Linkedin';

  @override
  String get orContinueWith => 'Or Continue With';

  @override
  String get yourPhoneNumber => 'Your Phone Number';

  @override
  String get loginToYourAccount => 'Login to Your Account';

  @override
  String get createYourAccount => 'Create Your Account';

  @override
  String get phone => 'Phone';

  @override
  String get phoneHint => '11 5555 6600';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Password123';

  @override
  String get fullName => 'Full Name';

  @override
  String get fullNameHint => 'Ahmed Aly Najiub';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgetPassword => 'Forget Password';

  @override
  String get forgetPasswordQuestion => 'Forget password?';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get login => 'Login';

  @override
  String get skipToLogin => 'Skip to Login';

  @override
  String get loading => 'Loading...';

  @override
  String get loginSuccessful => 'Login Successful';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get haveAccount => 'Have an account?';

  @override
  String get otpSentToWhatsApp => 'OTP sent to your WhatsApp';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get verifyOtpDescription =>
      'Enter the verification code sent to your WhatsApp number';

  @override
  String get verify => 'Verify';

  @override
  String get resend => 'Resend';

  @override
  String resendCountdown(String seconds) {
    return '00:$seconds';
  }

  @override
  String get otpResentSuccessfully => 'OTP resent successfully';

  @override
  String get failedToResendOtp => 'Failed to resend OTP';

  @override
  String get pleaseEnterSixDigitOtp => 'Please enter the 6-digit OTP';

  @override
  String get forgetPasswordDescription =>
      'Enter your phone number and a message will be sent to your WhatsApp account that include a link to change your password';

  @override
  String get send => 'Send';

  @override
  String get otpSentSuccessfully => 'OTP Sent Successfully';

  @override
  String get setNewPassword => 'Set New Password';

  @override
  String get setNewPasswordDescription =>
      'Enter your new password and confirm to set the new password to your account';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get submit => 'Submit';

  @override
  String get passwordResetSuccessfully => 'Password reset successfully';

  @override
  String get next => 'Next';

  @override
  String get onboardingPage1Title => 'Join Your \nProfessional Network';

  @override
  String get onboardingPage1Description =>
      'Connect with professionals and companies in your industry.Build your profile, grow your network, and discover real opportunities.';

  @override
  String get onboardingPage2Title => 'Grow Your Career\n or Your Business';

  @override
  String get onboardingPage2DescriptionHeader => 'For Professionals.';

  @override
  String get onboardingPage2Description =>
      'Find the right job, develop your skills, and grow your professional network.';

  @override
  String get onboardingPage3Title => 'Grow Your Career\n or Your Business';

  @override
  String get onboardingPage3DescriptionHeader => 'For Businesses.';

  @override
  String get onboardingPage3Description =>
      'Hire talent, expand your market, and connect with suppliers and industry services.';

  @override
  String get onboardingPage4Title => 'Smart Services for Your Industry';

  @override
  String get onboardingPage4Description =>
      'Access marketplaces, consulting, analytics, and AI-powered insights to grow and scale your business.';

  @override
  String get fullNameRequired => 'Full name is required';

  @override
  String get validFullName => 'Enter a valid full name';

  @override
  String get phoneRequired => 'Phone number is required';

  @override
  String get validPhone => 'Enter a valid phone number';

  @override
  String get phoneNoLeadingZero =>
      'Don\'t include the leading 0 — the country code handles it (e.g. 1012345678 not 01012345678)';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get confirmPasswordRequired => 'Confirm password is required';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get otpRequired => 'OTP is required';

  @override
  String get otpSixDigits => 'OTP must be 6 digits';

  @override
  String get otpNumbersOnly => 'OTP must contain numbers only';

  @override
  String get connectionTimeout => 'Connection timeout';

  @override
  String get sendTimeout => 'Send timeout';

  @override
  String get receiveTimeout => 'Receive timeout';

  @override
  String get badCertificate => 'Bad certificate';

  @override
  String get requestCancelled => 'Request cancelled';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get unexpectedError => 'Unexpected error occurred';

  @override
  String get tooManyRequests => 'Too many requests. Please try again later.';

  @override
  String get internalServerError => 'Internal server error';

  @override
  String get stayTuned => 'Stay Tuned!';

  @override
  String get stayTunedDescription =>
      'The premier ecosystem connecting manufacturers, wholesalers, and brands. Enter your phone number or your email and you will be the first to know and Join FRC network when we are live.';

  @override
  String get stayTunedFooter => 'Shaping the Future of\nFashion & Beauty';

  @override
  String get stayTunedSuccess => 'You have been added to our waitlist!';
}
