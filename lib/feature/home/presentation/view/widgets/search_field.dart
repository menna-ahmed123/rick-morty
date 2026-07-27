import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/home_strings.dart';
import 'package:task/feature/home/presentation/view_model/character_view_model.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<CharacterViewModel>().getCharacters(
          name: value.trim().isEmpty ? null : value.trim(),
        );
      },
      decoration: InputDecoration(
        hintText: HomeStrings.searchHint,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
