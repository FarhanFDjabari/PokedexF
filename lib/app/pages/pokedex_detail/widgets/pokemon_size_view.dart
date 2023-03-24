import 'package:flutter/material.dart';

class PokemonSizeView extends StatelessWidget {
  const PokemonSizeView({
    super.key,
    required this.weight,
    required this.height,
  });

  final double? weight;
  final double? height;

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
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              textScaleFactor: 0.95,
            ),
            const SizedBox(height: 5),
            Text(
              "Weight",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
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
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              textScaleFactor: 0.95,
            ),
            const SizedBox(height: 5),
            Text(
              "Height",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
