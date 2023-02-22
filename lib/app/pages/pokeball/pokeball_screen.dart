import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart';
import 'package:pokedex_f/injection.dart';

class PokeballScreen extends StatelessWidget {
  const PokeballScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokeballBloc>(),
      child: Container(),
    );
  }
}
