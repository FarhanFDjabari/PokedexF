import 'package:flutter/material.dart';

class PokemonSizeView extends StatelessWidget {
  const PokemonSizeView({
    super.key,
    required this.weight,
    required this.height,
    required this.theme,
  });

  final double? weight;
  final double? height;
  final ThemeData theme;

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
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
              textScaleFactor: 0.95,
            ),
            const SizedBox(height: 5),
            Text(
              "Weight",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
          ],
        ),
        const SizedBox(width: 25),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$height M",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
              textScaleFactor: 0.95,
            ),
            const SizedBox(height: 5),
            Text(
              "Height",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
