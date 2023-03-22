import 'package:flutter/material.dart';

mixin CollapseMixin<T extends StatefulWidget> on State<T> {
  bool isCollapse = false;

  void listenCollapse({
    required ScrollController controller,
    double maxOffset = 200,
  }) {
    controller.addListener(() {
      final offset = controller.offset;

      if (!mounted) return;

      if (offset > maxOffset && !isCollapse) {
        setState(() {
          isCollapse = true;
        });
      } else if (offset < maxOffset && isCollapse) {
        setState(() {
          isCollapse = false;
        });
      }
    });
  }
}
