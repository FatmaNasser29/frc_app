import 'package:frc_app/core/api/api_service.dart';
import 'package:frc_app/features/auth/shared/data/datasource/otp_remote_data_source.dart';
import 'package:frc_app/features/auth/shared/data/models/resend_otp_request.dart';
import 'package:frc_app/features/auth/shared/data/models/resend_otp_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResendOtpRemoteDatasource)
class ResendOtpRemoteDatasourceImpl implements ResendOtpRemoteDatasource {
  final ApiService apiService;

  ResendOtpRemoteDatasourceImpl(this.apiService);

  @override
  Future<ResendOtpResponse> resendOtp(String phoneNumber) {
    return apiService.resendOtp(ResendOtpRequest(phoneNumber: phoneNumber));
  }
}
