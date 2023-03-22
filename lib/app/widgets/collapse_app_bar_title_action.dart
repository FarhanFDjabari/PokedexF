import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CollapseAppBarTitleAction extends StatelessWidget
    implements PreferredSizeWidget {
  final Size size;
  final ScrollController controller;
  final bool isCollapse;
  final bool autoImplyLeading;
  final String title;
  final List<Widget> actions;
  final Color? dominantColor;

  const CollapseAppBarTitleAction({
    required this.size,
    required this.controller,
    required this.isCollapse,
    required this.title,
    required this.actions,
    this.autoImplyLeading = true,
    this.dominantColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        isCollapse ? Theme.of(context).colorScheme.onBackground : Colors.white;
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
              color: (dominantColor ?? Theme.of(context).colorScheme.primary)
                  .withOpacity(opacity),
              child: child,
            );
          },
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (autoImplyLeading)
                  IconButton(
                    onPressed: () {
                      if (context.canPop()) context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: foregroundColor,
                    ),
                  ),
                SizedBox(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: foregroundColor,
                        ),
                  ),
                ),
                const Spacer(),
                ...actions,
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
