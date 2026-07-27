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
import 'package:task/feature/home/domain/repos/character_repo.dart' as _i1054;
import 'package:task/feature/home/domain/use_cases/get_character_use_cases.dart'
    as _i992;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i992.GetCharactersUseCase>(
      () => _i992.GetCharactersUseCase(
        repository: gh<_i1054.CharacterRepository>(),
      ),
    );
    return this;
  }
}
