import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

class PokedexItem extends StatelessWidget {
  const PokedexItem({
    super.key,
    this.dominantColor,
    this.isConnectionStateWaiting = false,
    required this.pokedexData,
    this.onTap,
  });

  final bool isConnectionStateWaiting;
  final Color? dominantColor;
  final PokemonListItemEntity pokedexData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: onTap,
    //   child: AnimatedContainer(
    //     duration: const Duration(milliseconds: 550),
    //     width: double.maxFinite,
    //     height: double.maxFinite,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(15),
    //       color: !isConnectionStateWaiting
    //           ? dominantColor
    //           : Theme.of(context).colorScheme.surface,
    //       image: DecorationImage(
    //         image: const AssetImage(
    //           'assets/images/pokeball_overlay_bg_frame.png',
    //         ),
    //         opacity: 0.5,
    //         scale: 0.5,
    //         colorFilter: ColorFilter.mode(
    //           dominantColor ?? Colors.transparent,
    //           BlendMode.colorBurn,
    //         ),
    //       ),
    //     ),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         if (isConnectionStateWaiting)
    //           const SizedBox(
    //             width: 15,
    //             height: 15,
    //             child: CircularProgressIndicator.adaptive(
    //               strokeWidth: 2,
    //             ),
    //           ),
    //         if (!isConnectionStateWaiting)
    //           Image.network(
    //             pokedexData.url,
    //             height: 100,
    //             width: 100,
    //             fit: BoxFit.contain,
    //           ),
    //         if (!isConnectionStateWaiting) const SizedBox(height: 10),
    //         if (!isConnectionStateWaiting)
    //           Text(
    //             toBeginningOfSentenceCase(pokedexData.name) ?? "",
    //             style: Theme.of(context).textTheme.titleSmall?.copyWith(
    //                   color: Theme.of(context).colorScheme.onPrimary,
    //                 ),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
    return AnimatedContainer(
      duration: const Duration(milliseconds: 550),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: !isConnectionStateWaiting
            ? dominantColor
            : Theme.of(context).colorScheme.surface,
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/pokeball_overlay_bg_frame.png',
          ),
          opacity: 0.5,
          scale: 0.5,
          colorFilter: ColorFilter.mode(
            dominantColor ?? Colors.transparent,
            BlendMode.colorBurn,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isConnectionStateWaiting)
            const SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
              ),
            ),
          if (!isConnectionStateWaiting)
            Image.network(
              pokedexData.url,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          if (!isConnectionStateWaiting) const SizedBox(height: 10),
          if (!isConnectionStateWaiting)
            Text(
              toBeginningOfSentenceCase(pokedexData.name) ?? "",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
        ],
      ),
    );
  }
}
