import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const PokedexListScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeThroughTransition(
              fillColor: Theme.of(context).colorScheme.background,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: RoutePath.pokedexDetailScreen,
          name: RouteName.pokedexDetailScreen,
          builder: (context, state) => PokedexDetailScreen(
            pokemonName: "${state.params['pokemonName']}",
            dominantColor: state.extra as Color,
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
