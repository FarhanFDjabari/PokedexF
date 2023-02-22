import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/injection.dart';

class PokedexListScreen extends StatelessWidget {
  const PokedexListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokedexListBloc>(),
      child: Placeholder(
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
