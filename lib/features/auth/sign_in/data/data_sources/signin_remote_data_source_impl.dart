import 'package:frc_app/core/api/api_service.dart';
import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_remote_data_source.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/signin_response.dart';
import 'package:frc_app/features/auth/sign_in/data/models/verify_signin_request.dart';
import 'package:frc_app/features/auth/sign_in/data/models/verify_signin_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SigninRemoteDataSource)
class SigninRemoteDataSourceImpl implements SigninRemoteDataSource {
  final ApiService apiService;

  SigninRemoteDataSourceImpl(this.apiService);

  @override
  Future<SigninResponse> signIn(SigninRequest request) {
    return apiService.signIn(request);
  }

  @override
  Future<VerifySigninResponse> verifySignin(VerifySigninRequest request) {
    return apiService.verifySignin(request);
  }
}
