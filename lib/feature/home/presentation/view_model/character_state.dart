import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task/config/base_state/base_state.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';

part 'character_state.freezed.dart';

@freezed
sealed class CharacterState with _$CharacterState {
  const factory CharacterState({
    BaseState<List<CharacterEntity>>? charactersState,
  }) = _CharacterState;

  factory CharacterState.initial() =>
      CharacterState(charactersState: BaseState<List<CharacterEntity>>());
}
