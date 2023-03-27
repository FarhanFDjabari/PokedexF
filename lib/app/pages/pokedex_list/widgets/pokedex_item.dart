import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

class PokedexItem extends StatelessWidget {
  const PokedexItem({
    super.key,
    this.dominantColor,
    required this.pokedexData,
    required this.backgroundColor,
    required this.textStyle,
  });

  final Color? dominantColor;
  final PokemonListItemEntity pokedexData;
  final Color backgroundColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 550),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: dominantColor ?? backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UIHelper.networkImageLoader(
            imageUrl: pokedexData.artworkUrl,
            height: 150,
            width: 150,
            scale: 1,
            fit: BoxFit.contain,
            useLoadingBuilder: true,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: UIHelper.padSymmetric(horizontal: 8.0),
            child: Text(
              toBeginningOfSentenceCase(pokedexData.name) ?? "",
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
