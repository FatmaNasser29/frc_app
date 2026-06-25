import 'package:auth/shared/resend_otp/data/datasource/resend_otp_remote_data_source.dart';
import 'package:auth/shared/resend_otp/data/models/resend_otp_response.dart';
import 'package:auth/shared/resend_otp/domain/repository/resend_otp_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ResendOtpRepository)
class ResendOtpRepositoryImpl implements ResendOtpRepository {
  final ResendOtpRemoteDatasource datasource;

  ResendOtpRepositoryImpl(this.datasource);

  @override
  Future<ResendOtpResponse> resendOtp(String phoneNumber) {
    return datasource.resendOtp(phoneNumber);
  }
}
