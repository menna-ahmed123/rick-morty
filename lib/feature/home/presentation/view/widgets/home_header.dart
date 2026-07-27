import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constants/home_strings.dart';
import 'package:task/core/resources/app_text_styles.dart';
import 'package:task/feature/home/presentation/view_model/character_view_model.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(HomeStrings.appTitle, style: AppTextStyles.title),
        ),
        OutlinedButton.icon(
          onPressed: () {
            context.read<CharacterViewModel>().exportCharacters();
          },
          icon: const Icon(Icons.file_download_outlined),
          label: const Text(HomeStrings.export),
        ),
      ],
    );
  }
}
