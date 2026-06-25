import 'package:frc_app/core/api/api_service.dart';
import 'package:frc_app/features/auth/reset_password/data/models/reset_password_request.dart';
import 'package:frc_app/features/auth/reset_password/data/models/reset_password_response.dart';
import 'package:injectable/injectable.dart';
import 'reset_password_remote_data_source.dart';

@Injectable(as: ResetPasswordRemoteDataSource)
class ResetPasswordRemoteDataSourceImpl
    implements ResetPasswordRemoteDataSource {
  final ApiService apiService;

  ResetPasswordRemoteDataSourceImpl(this.apiService);

  @override
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request) {
    return apiService.resetPassword(request);
  }
}
