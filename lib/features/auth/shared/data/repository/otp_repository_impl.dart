import 'package:frc_app/features/auth/shared/data/datasource/otp_remote_data_source.dart';
import 'package:frc_app/features/auth/shared/data/models/resend_otp_response.dart';
import 'package:frc_app/features/auth/shared/domain/repository/otp_repository.dart';
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
