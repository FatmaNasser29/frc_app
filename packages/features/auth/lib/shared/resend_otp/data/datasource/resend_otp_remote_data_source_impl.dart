import '../../../../src/api/auth_api_service.dart';
import 'package:auth/shared/resend_otp/data/datasource/resend_otp_remote_data_source.dart';
import 'package:auth/shared/resend_otp/data/models/resend_otp_request.dart';
import 'package:auth/shared/resend_otp/data/models/resend_otp_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResendOtpRemoteDatasource)
class ResendOtpRemoteDatasourceImpl implements ResendOtpRemoteDatasource {
  final AuthApiService apiService;

  ResendOtpRemoteDatasourceImpl(this.apiService);

  @override
  Future<ResendOtpResponse> resendOtp(String phoneNumber) {
    return apiService.resendOtp(ResendOtpRequest(phoneNumber: phoneNumber));
  }
}
