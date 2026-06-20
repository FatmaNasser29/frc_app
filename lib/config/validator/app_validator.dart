import 'package:frc_app/l10n/app_localizations.dart';

class AppValidators {
  static String? validateFullName(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fullNameRequired;
    }

    if (value.trim().length < 3) {
      return l10n.validFullName;
    }

    return null;
  }

  static String? validatePhone(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.phoneRequired;
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');

    if (!phoneRegex.hasMatch(value.trim())) {
      return l10n.validPhone;
    }

    return null;
  }

  static String? validatePassword(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.passwordRequired;
    }

    if (value.length < 8) {
      return l10n.passwordMinLength;
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String password,
    AppLocalizations l10n,
  ) {
    if (value == null || value.isEmpty) {
      return l10n.confirmPasswordRequired;
    }

    if (value != password) {
      return l10n.passwordsDoNotMatch;
    }

    return null;
  }

  static String? validateOtp(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.otpRequired;
    }

    if (value.trim().length != 6) {
      return l10n.otpSixDigits;
    }

    if (!RegExp(r'^[0-9]{6}$').hasMatch(value.trim())) {
      return l10n.otpNumbersOnly;
    }

    return null;
  }
}
