import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_f/app/styles/theme.dart';
import 'package:pokedex_f/app/widgets/remove_focus_node.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(680, 1780),
      builder: (context, child) => GestureDetector(
        onTap: () => removeFocusNode(context),
        child: MaterialApp.router(
          title: 'PokedexF',
          debugShowCheckedModeBanner: false,
          theme: getPokedexTheme(),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: const CupertinoScrollBehavior(),
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
