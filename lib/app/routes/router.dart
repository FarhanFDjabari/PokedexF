import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_f/app/pages/pokeball/pokeball_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/pokedex_detail_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/pokedex_list_screen.dart';
import 'package:pokedex_f/app/pages/splash/splash_screen.dart';
import 'package:pokedex_f/app/routes/route_name.dart';
import 'package:pokedex_f/app/routes/route_path.dart';

final router = GoRouter(
  initialLocation: RoutePath.splashScreen,
  debugLogDiagnostics: !kReleaseMode,
  routes: [
    GoRoute(
      path: RoutePath.splashScreen,
      name: RouteName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.pokedexScreen,
      name: RouteName.pokedexScreen,
      builder: (context, state) => const PokedexListScreen(),
      routes: [
        GoRoute(
          path: RoutePath.pokedexDetailScreen,
          name: RouteName.pokedexDetailScreen,
          builder: (context, state) => PokedexDetailScreen(
            pokemonName: "${state.params['pokemonName']}",
          ),
        ),
      ],
    ),
    GoRoute(
      path: RoutePath.pokeballScreen,
      name: RouteName.pokeballScreen,
      builder: (context, state) => const PokeballScreen(),
    ),
  ],
);
