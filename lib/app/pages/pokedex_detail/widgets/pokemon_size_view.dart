import 'package:flutter/material.dart';

class PokemonSizeView extends StatelessWidget {
  const PokemonSizeView({
    super.key,
    required this.weight,
    required this.height,
    this.valueTextStyle,
    this.titleTextStyle,
  });

  final double? weight;
  final double? height;
  final TextStyle? valueTextStyle;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$weight KG",
              style: valueTextStyle,
              textScaleFactor: 0.95,
            ),
            const SizedBox(height: 5),
            Text(
              "Weight",
              style: titleTextStyle,
            ),
          ],
        ),
        const SizedBox(width: 25),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$height M",
              style: valueTextStyle,
              textScaleFactor: 0.95,
            ),
            const SizedBox(height: 5),
            Text(
              "Height",
              style: titleTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
