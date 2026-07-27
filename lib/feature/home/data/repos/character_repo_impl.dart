import 'package:injectable/injectable.dart';
import 'package:task/config/base_response/base_response.dart';
import 'package:task/feature/home/data/data_sources/character_remote_data_source.dart';
import 'package:task/feature/home/data/models/character_model.dart';
import 'package:task/feature/home/data/models/character_response_model.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';
import 'package:task/feature/home/domain/repos/character_repo.dart';

@LazySingleton(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl(this.remoteDataSource);

  final CharacterRemoteDataSource remoteDataSource;

  @override
  Future<BaseResponse<List<CharacterEntity>>> getCharacters({
    String? name,
  }) async {
    final BaseResponse<CharacterResponseModel> response = await remoteDataSource
        .getCharacters(name: name);

    switch (response) {
      case SuccessResponse<CharacterResponseModel>():
        final List<CharacterEntity> characters = response.data.characters
            .map((character) => character.toDomain())
            .toList();

        return SuccessResponse<List<CharacterEntity>>(characters);

      case ErrorResponse<CharacterResponseModel>():
        return ErrorResponse<List<CharacterEntity>>(
          errMessage: response.errMessage,
        );
    }
  }
}
