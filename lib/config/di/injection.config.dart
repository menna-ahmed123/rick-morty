// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:task/config/dio/dio_module.dart' as _i46;
import 'package:task/feature/home/api/client/character_api_client.dart'
    as _i367;
import 'package:task/feature/home/api/data_sources/remote_data_source_impl.dart'
    as _i267;
import 'package:task/feature/home/data/data_sources/character_remote_data_source.dart'
    as _i314;
import 'package:task/feature/home/data/repos/character_repo_impl.dart' as _i663;
import 'package:task/feature/home/domain/repos/character_repo.dart' as _i1054;
import 'package:task/feature/home/domain/use_cases/get_character_use_cases.dart'
    as _i992;
import 'package:task/feature/home/presentation/view_model/character_view_model.dart'
    as _i421;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i367.CharacterApiClient>(
      () => _i367.CharacterApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i314.CharacterRemoteDataSource>(
      () => _i267.CharacterRemoteDataSourceImpl(gh<_i367.CharacterApiClient>()),
    );
    gh.lazySingleton<_i1054.CharacterRepository>(
      () =>
          _i663.CharacterRepositoryImpl(gh<_i314.CharacterRemoteDataSource>()),
    );
    gh.lazySingleton<_i992.GetCharactersUseCase>(
      () => _i992.GetCharactersUseCase(
        repository: gh<_i1054.CharacterRepository>(),
      ),
    );
    gh.factory<_i421.CharacterViewModel>(
      () => _i421.CharacterViewModel(gh<_i992.GetCharactersUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i46.DioModule {}
