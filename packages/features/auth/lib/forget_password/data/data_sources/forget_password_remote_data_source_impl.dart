import '../../../src/api/auth_api_service.dart';
import 'package:auth/forget_password/data/models/forget_password_request.dart';
import 'package:auth/forget_password/data/models/forget_password_response.dart';
import 'package:injectable/injectable.dart';
import 'forget_password_remote_data_source.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final AuthApiService apiService;

  ForgetPasswordRemoteDataSourceImpl(this.apiService);

  @override
  Future<ForgetPasswordResponse> sendOtp(ForgetPasswordRequest request) {
    return apiService.forgetPassword(request);
  }
}
