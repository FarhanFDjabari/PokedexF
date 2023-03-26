import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:sprintf/sprintf.dart';

class PokedexSearchResultTile extends StatelessWidget {
  const PokedexSearchResultTile({
    required this.title,
    required this.number,
    required this.imageUrl,
    required this.theme,
    this.dominantColor,
    this.onTap,
    this.isConnectionStateWaiting = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final int number;
  final Color? dominantColor;
  final bool isConnectionStateWaiting;
  final VoidCallback? onTap;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 550),
      decoration: BoxDecoration(
        color: dominantColor?.withOpacity(0.45) ?? kGreyColor.withOpacity(0.45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: isConnectionStateWaiting
            ? SizedBox(
                height: 56,
                width: 56,
                child: Image.asset(
                  "assets/images/pokeball_loading_light.png",
                  width: 25,
                  height: 25,
                ),
              )
            : Image.network(
                imageUrl,
                height: 56,
                width: 56,
                scale: 1,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }

                  return SizedBox(
                    height: 56,
                    width: 56,
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
                    height: 56,
                    width: 56,
                    child: Image.asset(
                      "assets/images/pikachu_placeholder_icon.png",
                    ),
                  );
                },
              ),
        title: Text(
          "${toBeginningOfSentenceCase(title)}",
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
        subtitle: Text(
          sprintf("#%03d", [number]),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        splashColor: dominantColor ?? theme.colorScheme.primary,
        onTap: onTap,
      ),
    );
  }
}
