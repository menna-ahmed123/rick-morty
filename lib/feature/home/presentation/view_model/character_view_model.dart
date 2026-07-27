import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task/config/base_response/base_response.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';
import 'package:task/feature/home/domain/use_cases/get_character_use_cases.dart';
import 'package:task/feature/home/presentation/view_model/character_state.dart';

@injectable
class CharacterViewModel extends Cubit<CharacterState> {
  CharacterViewModel(this._getCharactersUseCase)
    : super(CharacterState.initial());

  final GetCharactersUseCase _getCharactersUseCase;

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
}
