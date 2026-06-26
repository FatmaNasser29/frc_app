import 'package:flutter/widgets.dart';
import 'app_localizations.dart';

extension L10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AppLocalizationsFormatting on AppLocalizations {
  String resendCountdownText(int secondsRemaining) {
    return resendCountdown(secondsRemaining.toString().padLeft(2, '0'));
  }
}
