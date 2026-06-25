import 'package:auth/sign_in/data/data_sources/signin_local_data_source.dart';
import 'package:auth/sign_in/data/data_sources/signin_remote_data_source.dart';
import 'package:auth/sign_in/data/models/signin_request.dart';
import 'package:auth/sign_in/data/models/signin_response.dart';
import 'package:auth/sign_in/data/models/verify_signin_request.dart';
import 'package:auth/sign_in/data/models/verify_signin_response.dart';
import 'package:auth/sign_in/domain/repositories/signin_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SigninRepo)
class SigninRepoImpl implements SigninRepo {
  final SigninRemoteDataSource remoteDataSource;
  final SigninLocalDataSource localDataSource;
  SigninRepoImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<SigninResponse> signIn(SigninRequest request) async {
    final response = await remoteDataSource.signIn(request);

    await localDataSource.saveAccessToken(response.accessToken);

    await localDataSource.saveRefreshToken(response.refreshToken);

    return response;
  }

  @override
  Future<VerifySigninResponse> verifySignin(VerifySigninRequest request) async {
    final response = await remoteDataSource.verifySignin(request);

    await localDataSource.saveAccessToken(response.accessToken);

    await localDataSource.saveRefreshToken(response.refreshToken);

    return response;
  }
}
