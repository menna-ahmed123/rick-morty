import 'package:task/config/base_response/base_response.dart';
import 'package:task/feature/home/data/models/character_response_model.dart';

abstract class CharacterRemoteDataSource {
  Future<BaseResponse<CharacterResponseModel>> getCharacters({String? name});
}
