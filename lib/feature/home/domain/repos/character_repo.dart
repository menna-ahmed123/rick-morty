import 'package:task/config/base_response/base_response.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<BaseResponse<List<CharacterEntity>>> getCharacters({String? name});
}
