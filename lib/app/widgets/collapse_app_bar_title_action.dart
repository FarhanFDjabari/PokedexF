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
  final Color defaultColor;
  final Color backgroundColor;
  final TextStyle? titleTextStyle;

  const CollapseAppBarTitleAction({
    required this.size,
    required this.controller,
    required this.isCollapse,
    required this.title,
    required this.actions,
    required this.defaultColor,
    required this.backgroundColor,
    this.titleTextStyle,
    this.autoImplyLeading = true,
    this.isCenterTitle = false,
    this.dominantColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isCollapse ? backgroundColor : Colors.white;
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
                    color: (dominantColor ?? defaultColor).withOpacity(opacity),
                    child: child,
                  )
                : ColoredBox(
                    color: Colors.transparent,
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
                      style: titleTextStyle?.copyWith(
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
