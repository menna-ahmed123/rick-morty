import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/core/constants/endpoints.dart';
import 'package:task/feature/home/data/models/character_response_model.dart';

part 'character_api_client.g.dart';

@singleton
@RestApi()
abstract class CharacterApiClient {
  @factoryMethod
  factory CharacterApiClient(Dio dio) = _CharacterApiClient;

  @GET(Endpoints.getCharacter)
  Future<CharacterResponseModel> getCharacters({@Query('name') String? name});
}
