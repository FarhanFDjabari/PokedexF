import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:sprintf/sprintf.dart';

class PokedexSearchResultTile extends StatelessWidget {
  const PokedexSearchResultTile({
    required this.title,
    required this.number,
    required this.imageUrl,
    required this.defaultColor,
    this.textStyle,
    this.dominantColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final int number;
  final Color? dominantColor;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final Color defaultColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 550),
      decoration: BoxDecoration(
        color: dominantColor?.withOpacity(0.45) ?? kGreyColor.withOpacity(0.45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: SizedBox(
          width: 56,
          height: 56,
          child: UIHelper.networkImageLoader(
            imageUrl: imageUrl,
            height: 56,
            width: 56,
            scale: 1,
            fit: BoxFit.contain,
            useLoadingBuilder: true,
          ),
        ),
        title: Text(
          "${toBeginningOfSentenceCase(title)}",
          style: textStyle,
        ),
        subtitle: Text(
          sprintf("#%03d", [number]),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        splashColor: dominantColor ?? defaultColor,
        onTap: onTap,
      ),
    );
  }
}
