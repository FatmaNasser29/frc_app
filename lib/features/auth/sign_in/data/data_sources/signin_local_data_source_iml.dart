import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: SigninLocalDataSource)
class SigninLocalDataSourceImpl implements SigninLocalDataSource {
  static const _accessTokenKey = 'access_token';

  static const _refreshTokenKey = 'refresh_token';

  static const _lastUsedEmailKey = 'last_used_email';

  final SharedPreferences prefs;

  SigninLocalDataSourceImpl(this.prefs);

  @override
  Future<void> saveAccessToken(String token) async {
    await prefs.setString(_accessTokenKey, token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await prefs.setString(_refreshTokenKey, token);
  }

  @override
  String? getAccessToken() {
    return prefs.getString(_accessTokenKey);
  }

  @override
  String? getRefreshToken() {
    return prefs.getString(_refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await prefs.remove(_accessTokenKey);

    await prefs.remove(_refreshTokenKey);
  }

  @override
  Future<void> saveLastUsedEmail(String email) async {
    await prefs.setString(_lastUsedEmailKey, email);
  }

  @override
  String? getLastUsedEmail() {
    return prefs.getString(_lastUsedEmailKey);
  }
}
