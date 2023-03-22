import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex_f/app/pages/splash/bloc/splash_bloc.dart';
import 'package:pokedex_f/app/routes/route_name.dart';
import 'package:pokedex_f/injection.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => getIt<SplashBloc>()..add(SplashStart()),
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
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/pokemon_logo.png",
                  height: 250.sp,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 5),
                Lottie.asset(
                  "assets/raw/pokeball_lottie.json",
                  height: 50.sp,
                  width: 50.sp,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
