import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CollapseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final ScrollController controller;
  final bool isCollapse;
  final ThemeData theme;

  const CollapseAppBar({
    required this.size,
    required this.controller,
    required this.isCollapse,
    required this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:
          isCollapse ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
      child: SizedBox(
        height: preferredSize.height,
        width: preferredSize.width,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final opacity = controller.hasClients
                ? (controller.offset / 100.0).clamp(0.0, 1.0)
                : 0.0;

            return ColoredBox(
              color: theme.colorScheme.primary.withOpacity(opacity),
              child: child,
            );
          },
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: Image.asset(
                      'assets/images/pokemon_logo.png',
                      height: 50,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => size;
}
