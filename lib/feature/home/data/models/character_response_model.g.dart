// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponseModel _$CharacterResponseModelFromJson(
  Map<String, dynamic> json,
) => CharacterResponseModel(
  characters: (json['results'] as List<dynamic>)
      .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharacterResponseModelToJson(
  CharacterResponseModel instance,
) => <String, dynamic>{'results': instance.characters};
