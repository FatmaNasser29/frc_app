abstract class SigninLocalDataSource {
  Future<void> saveAccessToken(String token);

  Future<void> saveRefreshToken(String token);

  String? getAccessToken();

  String? getRefreshToken();

  Future<void> clearTokens();

  Future<void> saveLastUsedEmail(String email);

  String? getLastUsedEmail();
}
