// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:frc_app/core/api/api_service.dart' as _i14;
import 'package:frc_app/core/api/dio_module.dart' as _i606;
import 'package:frc_app/core/di/app_module.dart' as _i788;
import 'package:frc_app/core/di/network_module.dart' as _i347;
import 'package:frc_app/core/local_storage/shared_prefs_service.dart' as _i658;
import 'package:frc_app/features/auth/forget_password/data/data_sources/forget_password_remote_data_source.dart'
    as _i162;
import 'package:frc_app/features/auth/forget_password/data/data_sources/forget_password_remote_data_source_impl.dart'
    as _i400;
import 'package:frc_app/features/auth/forget_password/data/repositories/forget_password_repo_impl.dart'
    as _i983;
import 'package:frc_app/features/auth/forget_password/domain/repositories/forget_password_repo.dart'
    as _i284;
import 'package:frc_app/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i84;
import 'package:frc_app/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart'
    as _i300;
import 'package:frc_app/features/auth/reset_password/data/data_sources/reset_password_remote_data_source.dart'
    as _i861;
import 'package:frc_app/features/auth/reset_password/data/data_sources/reset_password_remote_data_source_impl.dart'
    as _i58;
import 'package:frc_app/features/auth/reset_password/data/repositories/reset_password_repository.dart'
    as _i42;
import 'package:frc_app/features/auth/reset_password/domain/repositories/reset_password_repository_impl.dart'
    as _i256;
import 'package:frc_app/features/auth/reset_password/domain/use_cases/reset_password_use_case.dart'
    as _i112;
import 'package:frc_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart'
    as _i905;
import 'package:frc_app/features/auth/shared/resend_otp/data/datasource/resend_otp_remote_data_source.dart'
    as _i228;
import 'package:frc_app/features/auth/shared/resend_otp/data/datasource/resend_otp_remote_data_source_impl.dart'
    as _i769;
import 'package:frc_app/features/auth/shared/resend_otp/data/repository/otp_repository_impl.dart'
    as _i663;
import 'package:frc_app/features/auth/shared/resend_otp/domain/repository/resend_otp_repository.dart'
    as _i285;
import 'package:frc_app/features/auth/shared/resend_otp/domain/usecases/resend_otp_usecase.dart'
    as _i874;
import 'package:frc_app/features/auth/shared/resend_otp/presentation/cubit/resend_otp_cubit.dart'
    as _i68;
import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_local_data_source.dart'
    as _i729;
import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_local_data_source_iml.dart'
    as _i328;
import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_remote_data_source.dart'
    as _i925;
import 'package:frc_app/features/auth/sign_in/data/data_sources/signin_remote_data_source_impl.dart'
    as _i240;
import 'package:frc_app/features/auth/sign_in/data/repositories/signin_repo_impl.dart'
    as _i865;
import 'package:frc_app/features/auth/sign_in/domain/repositories/signin_repo.dart'
    as _i993;
import 'package:frc_app/features/auth/sign_in/domain/use_cases/signin_use_case.dart'
    as _i489;
import 'package:frc_app/features/auth/sign_in/domain/use_cases/verify_signin_use_case.dart'
    as _i474;
import 'package:frc_app/features/auth/sign_in/presentation/cubit/signin_cubit.dart'
    as _i111;
import 'package:frc_app/features/auth/sign_up/data/data_sources/signup_remote_data_source.dart'
    as _i328;
import 'package:frc_app/features/auth/sign_up/data/data_sources/signup_remote_data_source_impl.dart'
    as _i535;
import 'package:frc_app/features/auth/sign_up/data/repositories/signup_repository_impl.dart'
    as _i714;
import 'package:frc_app/features/auth/sign_up/domain/repositories/signup_repository.dart'
    as _i597;
import 'package:frc_app/features/auth/sign_up/domain/use_cases/signup_use_case.dart'
    as _i714;
import 'package:frc_app/features/auth/sign_up/domain/use_cases/verify_registration_use_case.dart'
    as _i895;
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart'
    as _i814;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final dioModule = _$DioModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i14.ApiService>(
      () => networkModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i228.ResendOtpRemoteDatasource>(
      () => _i769.ResendOtpRemoteDatasourceImpl(gh<_i14.ApiService>()),
    );
    gh.factory<_i925.SigninRemoteDataSource>(
      () => _i240.SigninRemoteDataSourceImpl(gh<_i14.ApiService>()),
    );
    gh.factory<_i162.ForgetPasswordRemoteDataSource>(
      () => _i400.ForgetPasswordRemoteDataSourceImpl(gh<_i14.ApiService>()),
    );
    gh.factory<_i729.SigninLocalDataSource>(
      () => _i328.SigninLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i284.ForgetPasswordRepo>(
      () => _i983.ForgetPasswordRepoImpl(
        gh<_i162.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.singleton<_i658.SharedPrefsService>(
      () => _i658.SharedPrefsService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i285.ResendOtpRepository>(
      () =>
          _i663.ResendOtpRepositoryImpl(gh<_i228.ResendOtpRemoteDatasource>()),
    );
    gh.factory<_i993.SigninRepo>(
      () => _i865.SigninRepoImpl(
        gh<_i925.SigninRemoteDataSource>(),
        gh<_i729.SigninLocalDataSource>(),
      ),
    );
    gh.factory<_i861.ResetPasswordRemoteDataSource>(
      () => _i58.ResetPasswordRemoteDataSourceImpl(gh<_i14.ApiService>()),
    );
    gh.factory<_i84.ForgetPasswordUseCase>(
      () => _i84.ForgetPasswordUseCase(gh<_i284.ForgetPasswordRepo>()),
    );
    gh.factory<_i328.SignupRemoteDataSource>(
      () => _i535.SignupRemoteDataSourceImpl(gh<_i14.ApiService>()),
    );
    gh.factory<_i489.SigninUseCase>(
      () => _i489.SigninUseCase(gh<_i993.SigninRepo>()),
    );
    gh.factory<_i474.VerifySigninUseCase>(
      () => _i474.VerifySigninUseCase(gh<_i993.SigninRepo>()),
    );
    gh.factory<_i111.SigninCubit>(
      () => _i111.SigninCubit(
        gh<_i489.SigninUseCase>(),
        gh<_i474.VerifySigninUseCase>(),
      ),
    );
    gh.factory<_i874.ResendOtpUseCase>(
      () => _i874.ResendOtpUseCase(gh<_i285.ResendOtpRepository>()),
    );
    gh.factory<_i300.ForgetPasswordCubit>(
      () => _i300.ForgetPasswordCubit(gh<_i84.ForgetPasswordUseCase>()),
    );
    gh.factory<_i42.ResetPasswordRepository>(
      () => _i256.ResetPasswordRepositoryImpl(
        gh<_i861.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i68.ResendOtpCubit>(
      () => _i68.ResendOtpCubit(gh<_i874.ResendOtpUseCase>()),
    );
    gh.factory<_i597.SignupRepository>(
      () => _i714.SignupRepositoryImpl(gh<_i328.SignupRemoteDataSource>()),
    );
    gh.factory<_i714.SignupUseCase>(
      () => _i714.SignupUseCase(gh<_i597.SignupRepository>()),
    );
    gh.factory<_i895.VerifyRegistrationUseCase>(
      () => _i895.VerifyRegistrationUseCase(gh<_i597.SignupRepository>()),
    );
    gh.factory<_i814.SignupCubit>(
      () => _i814.SignupCubit(
        gh<_i714.SignupUseCase>(),
        gh<_i895.VerifyRegistrationUseCase>(),
        gh<_i729.SigninLocalDataSource>(),
      ),
    );
    gh.factory<_i112.ResetPasswordUseCase>(
      () => _i112.ResetPasswordUseCase(gh<_i42.ResetPasswordRepository>()),
    );
    gh.factory<_i905.ResetPasswordCubit>(
      () => _i905.ResetPasswordCubit(gh<_i112.ResetPasswordUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i788.AppModule {}

class _$DioModule extends _i606.DioModule {}

class _$NetworkModule extends _i347.NetworkModule {}
