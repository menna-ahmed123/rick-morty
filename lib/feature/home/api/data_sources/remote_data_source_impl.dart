import 'package:injectable/injectable.dart';
import 'package:task/config/base_response/base_response.dart';
import 'package:task/feature/home/api/client/character_api_client.dart';
import 'package:task/feature/home/data/data_sources/character_remote_data_source.dart';
import 'package:task/feature/home/data/models/character_response_model.dart';

@LazySingleton(as: CharacterRemoteDataSource)
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  CharacterRemoteDataSourceImpl(this.characterApiClient);

  final CharacterApiClient characterApiClient;

  @override
  Future<BaseResponse<CharacterResponseModel>> getCharacters({
    String? name,
  }) async {
    try {
      final response = await characterApiClient.getCharacters(name: name);

      return SuccessResponse<CharacterResponseModel>(response);
    } on Exception catch (e) {
      return ErrorResponse<CharacterResponseModel>(error: e);
    }
  }
}
