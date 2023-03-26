import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CollapseAppBarTitleAction extends StatelessWidget
    implements PreferredSizeWidget {
  final Size size;
  final ScrollController controller;
  final bool isCollapse;
  final bool autoImplyLeading;
  final bool isCenterTitle;
  final String title;
  final List<Widget> actions;
  final Color? dominantColor;
  final ThemeData theme;

  const CollapseAppBarTitleAction({
    required this.size,
    required this.controller,
    required this.isCollapse,
    required this.title,
    required this.actions,
    required this.theme,
    this.autoImplyLeading = true,
    this.isCenterTitle = false,
    this.dominantColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        isCollapse ? theme.colorScheme.onBackground : Colors.white;
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
              color: (dominantColor ?? theme.colorScheme.primary)
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
                  BackButton(
                    onPressed: () {
                      if (context.canPop()) context.pop();
                    },
                    color: foregroundColor,
                  ),
                Expanded(
                  child: Align(
                    alignment:
                        isCenterTitle ? Alignment.center : Alignment.centerLeft,
                    child: Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: foregroundColor,
                      ),
                    ),
                  ),
                ),
                ...actions,
                const SizedBox(width: 16),
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
