import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task/config/base_response/base_response.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';
import 'package:task/feature/home/domain/use_cases/export_characters_use_case.dart';
import 'package:task/feature/home/domain/use_cases/get_character_use_cases.dart';
import 'package:task/feature/home/presentation/view_model/character_state.dart';

@injectable
class CharacterViewModel extends Cubit<CharacterState> {
  CharacterViewModel(this._getCharactersUseCase, this._exportCharactersUseCase)
    : super(CharacterState.initial());

  final GetCharactersUseCase _getCharactersUseCase;
  final ExportCharactersUseCase _exportCharactersUseCase;

  Future<void> getCharacters({String? name}) async {
    log(
      'Fetching characters ${name != null ? "(Search: $name)" : ""}',
      name: 'CharacterViewModel',
    );

    emit(
      state.copyWith(
        charactersState: state.charactersState?.copyWith(
          isLoading: true,
          errorMessage: '',
        ),
      ),
    );

    final BaseResponse<List<CharacterEntity>> response =
        await _getCharactersUseCase(name: name);

    switch (response) {
      case SuccessResponse<List<CharacterEntity>>():
        log(
          'Success - ${response.data.length} characters fetched',
          name: 'CharacterViewModel',
        );

        emit(
          state.copyWith(
            charactersState: state.charactersState?.copyWith(
              isLoading: false,
              data: response.data,
            ),
          ),
        );
        break;

      case ErrorResponse<List<CharacterEntity>>():
        log('Error: ${response.errMessage}', name: 'CharacterViewModel');

        emit(
          state.copyWith(
            charactersState: state.charactersState?.copyWith(
              isLoading: false,
              errorMessage: response.errMessage,
            ),
          ),
        );
        break;
    }
  }

  Future<void> exportCharacters() async {
    final characters = state.charactersState?.data;

    if (characters == null || characters.isEmpty) {
      log('No characters to export', name: 'CharacterViewModel');
      return;
    }

    await _exportCharactersUseCase( characters);

    log('Characters exported successfully', name: 'CharacterViewModel');
  }
}
