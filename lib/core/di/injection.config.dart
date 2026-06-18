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
import 'package:frc_app/core/di/network_module.dart' as _i347;
import 'package:frc_app/features/auth/sign_up/data/data_sources/signup_remote_data_source.dart'
    as _i328;
import 'package:frc_app/features/auth/sign_up/data/data_sources/signup_remote_data_source_impl.dart'
    as _i535;
import 'package:frc_app/features/auth/sign_up/data/repositories/signup_repository_impl.dart'
    as _i714;
import 'package:frc_app/features/auth/sign_up/domain/repositories/signup_repository.dart'
    as _i597;
import 'package:frc_app/features/auth/sign_up/domain/use_cases/signup_use_case.dart'
    as _i715;
import 'package:frc_app/features/auth/sign_up/presentation/cubit/signup_cubit.dart'
    as _i814;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i14.ApiService>(
      () => networkModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i328.SignupRemoteDataSource>(
      () => _i535.SignupRemoteDataSourceImpl(gh<_i14.ApiService>()),
    );
    gh.factory<_i597.SignupRepository>(
      () => _i714.SignupRepositoryImpl(gh<_i328.SignupRemoteDataSource>()),
    );
    gh.factory<_i715.SignupUseCase>(
      () => _i715.SignupUseCase(gh<_i597.SignupRepository>()),
    );
    gh.factory<_i814.SignupCubit>(
      () => _i814.SignupCubit(gh<_i715.SignupUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i606.DioModule {}

class _$NetworkModule extends _i347.NetworkModule {}
