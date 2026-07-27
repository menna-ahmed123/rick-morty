import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/config/di/injection.dart';
import 'package:task/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:task/feature/home/presentation/view_model/character_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CharacterViewModel>()..getCharacters(),
      child: const Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
