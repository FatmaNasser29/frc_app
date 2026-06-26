// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../forget_password/data/data_sources/forget_password_remote_data_source.dart'
    as _i890;
import '../../forget_password/data/data_sources/forget_password_remote_data_source_impl.dart'
    as _i644;
import '../../forget_password/data/repositories/forget_password_repo_impl.dart'
    as _i887;
import '../../forget_password/domain/repositories/forget_password_repo.dart'
    as _i396;
import '../../forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i319;
import '../../forget_password/presentation/cubit/forget_password_cubit.dart'
    as _i627;
import '../../reset_password/data/data_sources/reset_password_remote_data_source.dart'
    as _i690;
import '../../reset_password/data/data_sources/reset_password_remote_data_source_impl.dart'
    as _i445;
import '../../reset_password/data/repositories/reset_password_repository.dart'
    as _i757;
import '../../reset_password/domain/repositories/reset_password_repository_impl.dart'
    as _i934;
import '../../reset_password/domain/use_cases/reset_password_use_case.dart'
    as _i693;
import '../../reset_password/presentation/cubit/reset_password_cubit.dart'
    as _i556;
import '../../shared/resend_otp/data/datasource/resend_otp_remote_data_source.dart'
    as _i139;
import '../../shared/resend_otp/data/datasource/resend_otp_remote_data_source_impl.dart'
    as _i865;
import '../../shared/resend_otp/data/repository/otp_repository_impl.dart'
    as _i263;
import '../../shared/resend_otp/domain/repository/resend_otp_repository.dart'
    as _i569;
import '../../shared/resend_otp/domain/usecases/resend_otp_usecase.dart'
    as _i794;
import '../../shared/resend_otp/presentation/cubit/resend_otp_cubit.dart'
    as _i932;
import '../../sign_in/data/data_sources/signin_local_data_source.dart' as _i582;
import '../../sign_in/data/data_sources/signin_local_data_source_iml.dart'
    as _i638;
import '../../sign_in/data/data_sources/signin_remote_data_source.dart'
    as _i818;
import '../../sign_in/data/data_sources/signin_remote_data_source_impl.dart'
    as _i820;
import '../../sign_in/data/repositories/signin_repo_impl.dart' as _i21;
import '../../sign_in/domain/repositories/signin_repo.dart' as _i226;
import '../../sign_in/domain/use_cases/signin_use_case.dart' as _i768;
import '../../sign_in/domain/use_cases/verify_signin_use_case.dart' as _i528;
import '../../sign_in/presentation/cubit/signin_cubit.dart' as _i566;
import '../../sign_up/data/data_sources/signup_remote_data_source.dart'
    as _i648;
import '../../sign_up/data/data_sources/signup_remote_data_source_impl.dart'
    as _i291;
import '../../sign_up/data/repositories/signup_repository_impl.dart' as _i829;
import '../../sign_up/domain/repositories/signup_repository.dart' as _i837;
import '../../sign_up/domain/use_cases/signup_use_case.dart' as _i706;
import '../../sign_up/domain/use_cases/verify_registration_use_case.dart'
    as _i294;
import '../../sign_up/presentation/cubit/signup_cubit.dart' as _i952;
import '../api/auth_api_service.dart' as _i688;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt initAuth(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.factory<_i139.ResendOtpRemoteDatasource>(
    () => _i865.ResendOtpRemoteDatasourceImpl(gh<_i688.AuthApiService>()),
  );
  gh.factory<_i818.SigninRemoteDataSource>(
    () => _i820.SigninRemoteDataSourceImpl(gh<_i688.AuthApiService>()),
  );
  gh.factory<_i890.ForgetPasswordRemoteDataSource>(
    () => _i644.ForgetPasswordRemoteDataSourceImpl(gh<_i688.AuthApiService>()),
  );
  gh.factory<_i690.ResetPasswordRemoteDataSource>(
    () => _i445.ResetPasswordRemoteDataSourceImpl(gh<_i688.AuthApiService>()),
  );
  gh.factory<_i648.SignupRemoteDataSource>(
    () => _i291.SignupRemoteDataSourceImpl(gh<_i688.AuthApiService>()),
  );
  gh.factory<_i396.ForgetPasswordRepo>(
    () => _i887.ForgetPasswordRepoImpl(
      gh<_i890.ForgetPasswordRemoteDataSource>(),
    ),
  );
  gh.factory<_i582.SigninLocalDataSource>(
    () => _i638.SigninLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
  );
  gh.factory<_i757.ResetPasswordRepository>(
    () => _i934.ResetPasswordRepositoryImpl(
      gh<_i690.ResetPasswordRemoteDataSource>(),
    ),
  );
  gh.factory<_i569.ResendOtpRepository>(
    () => _i263.ResendOtpRepositoryImpl(gh<_i139.ResendOtpRemoteDatasource>()),
  );
  gh.factory<_i319.ForgetPasswordUseCase>(
    () => _i319.ForgetPasswordUseCase(gh<_i396.ForgetPasswordRepo>()),
  );
  gh.factory<_i226.SigninRepo>(
    () => _i21.SigninRepoImpl(
      gh<_i818.SigninRemoteDataSource>(),
      gh<_i582.SigninLocalDataSource>(),
    ),
  );
  gh.factory<_i837.SignupRepository>(
    () => _i829.SignupRepositoryImpl(gh<_i648.SignupRemoteDataSource>()),
  );
  gh.factory<_i627.ForgetPasswordCubit>(
    () => _i627.ForgetPasswordCubit(gh<_i319.ForgetPasswordUseCase>()),
  );
  gh.factory<_i794.ResendOtpUseCase>(
    () => _i794.ResendOtpUseCase(gh<_i569.ResendOtpRepository>()),
  );
  gh.factory<_i932.ResendOtpCubit>(
    () => _i932.ResendOtpCubit(gh<_i794.ResendOtpUseCase>()),
  );
  gh.factory<_i768.SigninUseCase>(
    () => _i768.SigninUseCase(gh<_i226.SigninRepo>()),
  );
  gh.factory<_i528.VerifySigninUseCase>(
    () => _i528.VerifySigninUseCase(gh<_i226.SigninRepo>()),
  );
  gh.factory<_i566.SigninCubit>(
    () => _i566.SigninCubit(
      gh<_i768.SigninUseCase>(),
      gh<_i528.VerifySigninUseCase>(),
    ),
  );
  gh.factory<_i693.ResetPasswordUseCase>(
    () => _i693.ResetPasswordUseCase(gh<_i757.ResetPasswordRepository>()),
  );
  gh.factory<_i706.SignupUseCase>(
    () => _i706.SignupUseCase(gh<_i837.SignupRepository>()),
  );
  gh.factory<_i294.VerifyRegistrationUseCase>(
    () => _i294.VerifyRegistrationUseCase(gh<_i837.SignupRepository>()),
  );
  gh.factory<_i952.SignupCubit>(
    () => _i952.SignupCubit(
      gh<_i706.SignupUseCase>(),
      gh<_i294.VerifyRegistrationUseCase>(),
      gh<_i582.SigninLocalDataSource>(),
    ),
  );
  gh.factory<_i556.ResetPasswordCubit>(
    () => _i556.ResetPasswordCubit(gh<_i693.ResetPasswordUseCase>()),
  );
  return getIt;
}
