import 'package:injectable/injectable.dart';
import 'package:task/config/base_response/base_response.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';
import 'package:task/feature/home/domain/repos/character_repo.dart';

@lazySingleton
class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase( {required this.repository});

  Future<BaseResponse<List<CharacterEntity>>> call({String? name}) {
    return repository.getCharacters(name: name);
  }
}
