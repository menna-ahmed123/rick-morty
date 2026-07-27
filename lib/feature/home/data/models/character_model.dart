import 'package:json_annotation/json_annotation.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  const CharacterModel({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  CharacterEntity toDomain() {
    return CharacterEntity(
      name: name,
      status: status,
      species: species,
      gender: gender,
      image: image,
    );
  }
}
