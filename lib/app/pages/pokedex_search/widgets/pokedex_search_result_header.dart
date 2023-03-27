import 'package:flutter/material.dart';

class PokedexSearchResultHeader extends StatelessWidget {
  const PokedexSearchResultHeader(
      {required this.title, this.textStyle, Key? key})
      : super(key: key);
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        top: 16,
        bottom: 16,
      ),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
