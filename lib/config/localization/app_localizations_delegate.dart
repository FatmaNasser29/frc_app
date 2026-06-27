import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:core/core.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ar.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }
  throw FlutterError(
    'AppLocalizationsDelegate failed to load unsupported locale "$locale".',
  );
}
