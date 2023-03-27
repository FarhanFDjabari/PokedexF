import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_f/app/pages/splash/bloc/splash_bloc.dart';
import 'package:pokedex_f/app/routes/route_name.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/injection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc _splashBloc;

  @override
  void initState() {
    _splashBloc = getIt<SplashBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _splashBloc.close();
    getIt<SplashBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<SplashBloc>(
      create: (_) => _splashBloc..add(SplashStart()),
      child: Builder(builder: (context) {
        return BlocListener<SplashBloc, SplashState>(
          listener: (_, state) {
            if (state is SplashLoading) {
              context.read<SplashBloc>().add(SplashEnd());
            }
            if (state is SplashFinished) {
              context.goNamed(RouteName.pokedexScreen);
            }
          },
          child: Container(
            padding: UIHelper.padAll(16),
            color: theme.colorScheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIHelper.assetImageLoader(
                  assetUri: "assets/images/pokemon_logo.png",
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 5),
                UIHelper.pokeballLoading(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
