import 'package:core/core.dart';

class FashionAppBranding implements AppBranding {
  @override
  String get appName => 'Fashion Retail Club';

  @override
  String get logoPath => 'assets/images/frc_logo.png';
}

class FashionAppConfig implements AppConfig {
  @override
  String get apiBaseUrl => 'https://api.fashionretailclub.com/api/v1/';

  @override
  AppBranding get branding => FashionAppBranding();

  @override
  Map<String, bool> get featureFlags => {
    'socialLogin': true,
  };
}
