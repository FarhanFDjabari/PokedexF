import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

class PokedexItem extends StatelessWidget {
  const PokedexItem({
    super.key,
    this.dominantColor,
    this.isConnectionStateWaiting = false,
    required this.pokedexData,
    required this.theme,
  });

  final bool isConnectionStateWaiting;
  final Color? dominantColor;
  final PokemonListItemEntity pokedexData;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 550),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: !isConnectionStateWaiting
            ? dominantColor
            : theme.colorScheme.surface,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isConnectionStateWaiting)
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(
                "assets/images/pokeball_loading_light.png",
              ),
            ),
          if (!isConnectionStateWaiting)
            Image.network(
              pokedexData.artworkUrl,
              height: 100,
              width: 100,
              scale: 1,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 3,
                      value: loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    "assets/images/pikachu_placeholder_icon.png",
                  ),
                );
              },
            ),
          if (!isConnectionStateWaiting) const SizedBox(height: 10),
          if (!isConnectionStateWaiting)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                toBeginningOfSentenceCase(pokedexData.name) ?? "",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
