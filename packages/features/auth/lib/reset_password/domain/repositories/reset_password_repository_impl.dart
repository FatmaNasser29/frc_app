import 'package:auth/reset_password/data/data_sources/reset_password_remote_data_source.dart';
import 'package:auth/reset_password/data/models/reset_password_request.dart';
import 'package:auth/reset_password/data/models/reset_password_response.dart';
import 'package:auth/reset_password/data/repositories/reset_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResetPasswordRepository)
class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final ResetPasswordRemoteDataSource remote;

  ResetPasswordRepositoryImpl(this.remote);

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request) {
    return remote.resetPassword(request);
  }
}
