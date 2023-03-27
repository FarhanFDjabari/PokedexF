import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';

class CollapseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size size;
  final ScrollController controller;
  final bool isCollapse;
  final Color backgroundColor;

  const CollapseAppBar({
    required this.size,
    required this.controller,
    required this.isCollapse,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:
          (isCollapse ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light)
              .copyWith(
        systemNavigationBarColor: Colors.transparent,
      ),
      child: SizedBox(
        height: preferredSize.height,
        width: preferredSize.width,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final opacity = controller.hasClients
                ? (controller.offset / 100.0).clamp(0.0, 1.0)
                : 0.0;

            return opacity > 0
                ? ColoredBox(
                    color: backgroundColor.withOpacity(opacity),
                    child: child,
                  )
                : ColoredBox(color: Colors.transparent, child: child);
          },
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: UIHelper.assetImageLoader(
                      assetUri: 'assets/images/pokemon_logo_800_size.png',
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
