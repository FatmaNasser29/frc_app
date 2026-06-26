abstract class AppBranding {
  String get appName;
  String get logoPath;
}

abstract class AppConfig {
  String get apiBaseUrl;
  AppBranding get branding;
  Map<String, bool> get featureFlags;
}
