import 'package:json_annotation/json_annotation.dart';
import 'package:task/feature/home/data/models/character_model.dart';

part 'character_response_model.g.dart';

@JsonSerializable()
class CharacterResponseModel {
  @JsonKey(name: 'results')
  final List<CharacterModel> characters;

  const CharacterResponseModel({required this.characters});

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);
}
