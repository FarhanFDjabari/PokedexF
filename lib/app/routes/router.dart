import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_f/app/pages/pokeball/pokeball_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/pokedex_detail_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/pokedex_list_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_search/pokedex_search_screen.dart';
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
            final theme = Theme.of(context);
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              fillColor: theme.colorScheme.background,
              transitionType: SharedAxisTransitionType.scaled,
              child: child,
            );
          },
        );
      },
      routes: [
        GoRoute(
            path: RoutePath.pokedexDetailScreen,
            name: RouteName.pokedexDetailScreen,
            pageBuilder: (context, state) {
              final theme = Theme.of(context);
              return CustomTransitionPage(
                key: state.pageKey,
                child: PokedexDetailScreen(
                  pokemonName: "${state.params['pokemonName']}",
                  dominantColor: state.extra as Color,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    fillColor: theme.colorScheme.background,
                    transitionType: SharedAxisTransitionType.scaled,
                    child: child,
                  );
                },
              );
            }),
        GoRoute(
          path: RoutePath.pokedexSearchScreen,
          name: RouteName.pokedexSearchScreen,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const PokedexSearchScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final theme = Theme.of(context);
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  fillColor: theme.colorScheme.background,
                  transitionType: SharedAxisTransitionType.scaled,
                  child: child,
                );
              },
            );
          },
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
