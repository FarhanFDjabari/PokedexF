import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/data/models/type.dart';

class PokemonTypeView extends StatelessWidget {
  const PokemonTypeView({
    super.key,
    required this.types,
    this.textStyle,
  });

  final List<Type>? types;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 5,
      children: types
              ?.map(
                (e) => Container(
                  height: 30,
                  width: 100,
                  margin: UIHelper.padSymmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: ColorMapper.mapTypeToColor(e),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "${toBeginningOfSentenceCase(e.type?.name)}",
                      style: textStyle,
                    ),
                  ),
                ),
              )
              .toList() ??
          [],
    );
  }
}
