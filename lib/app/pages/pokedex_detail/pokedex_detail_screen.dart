import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart';
import 'package:pokedex_f/injection.dart';

class PokedexDetailScreen extends StatelessWidget {
  final String pokemonName;
  const PokedexDetailScreen({required this.pokemonName, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokedexDetailBloc>(),
      child: Container(),
    );
  }
}
