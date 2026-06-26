import 'package:auth/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import 'package:auth/forget_password/data/models/forget_password_request.dart';
import 'package:auth/forget_password/data/models/forget_password_response.dart';
import 'package:auth/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepoImpl(this.remoteDataSource);

  @override
  Future<ForgetPasswordResponse> sendOtp(ForgetPasswordRequest request) {
    return remoteDataSource.sendOtp(request);
  }
}
