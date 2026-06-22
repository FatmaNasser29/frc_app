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

  /// Strips the trunk prefix `0` from a local number when a country code is
  /// provided, then returns the full E.164-ready phone string.
  ///
  /// Examples:
  ///   normalizePhone('+20', '01012345678') → '+201012345678'
  ///   normalizePhone('+20', '1012345678')  → '+201012345678'
  ///   normalizePhone('',    '01012345678') → '01012345678'
  static String normalizePhone(String countryCode, String localNumber) {
    final local = localNumber.trim();
    final normalized =
        countryCode.isNotEmpty && local.startsWith('0')
            ? local.substring(1)
            : local;
    return '$countryCode$normalized';
  }

  static String? validatePhone(
    String? value,
    AppLocalizations l10n, {
    String countryCode = '',
  }) {
    if (value == null || value.trim().isEmpty) {
      return l10n.phoneRequired;
    }

    final localNumber = value.trim();

    // Local part must be digits only
    if (!RegExp(r'^[0-9]+$').hasMatch(localNumber)) {
      return l10n.validPhone;
    }

    // Strip trunk 0 (e.g. 01012345678 → 1012345678) before length check
    final stripped =
        countryCode.isNotEmpty && localNumber.startsWith('0')
            ? localNumber.substring(1)
            : localNumber;

    // Combine with country code digits and validate total E.164 length (7–15)
    final digitsOnly = countryCode.replaceAll(RegExp(r'\D'), '') + stripped;
    if (digitsOnly.length < 7 || digitsOnly.length > 15) {
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
