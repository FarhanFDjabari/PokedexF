import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/app.dart';
import 'package:pokedex_f/helper/pokedex_bloc_observer.dart';
import 'package:pokedex_f/injection.dart';

void main() async {
  Bloc.observer = PokedexBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  runApp(const PokedexApp());
}
