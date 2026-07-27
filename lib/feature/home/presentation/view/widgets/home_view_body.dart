import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/home_strings.dart';
import 'package:task/feature/home/domain/entities/character_entity.dart';
import 'package:task/feature/home/presentation/view/widgets/character_card.dart';
import 'package:task/feature/home/presentation/view/widgets/home_header.dart';
import 'package:task/feature/home/presentation/view/widgets/search_field.dart';
import 'package:task/feature/home/presentation/view_model/character_state.dart';
import 'package:task/feature/home/presentation/view_model/character_view_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const HomeHeader(),
          const SizedBox(height: 20),
          const SearchField(),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<CharacterViewModel, CharacterState>(
              builder: (context, state) {
                final charactersState = state.charactersState;

                if (charactersState?.isLoading ?? false) {
                  return const Center(child: CircularProgressIndicator());
                }

                if ((charactersState?.errorMessage ?? '').isNotEmpty) {
                  return Center(child: Text(charactersState!.errorMessage));
                }

                final List<CharacterEntity> characters =
                    charactersState?.data ?? [];

                if (characters.isEmpty) {
                  return const Center(
                    child: Text(HomeStrings.noCharactersFound),
                  );
                }

                return ListView.separated(
                  itemCount: characters.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (_, index) =>
                      CharacterCard(character: characters[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
