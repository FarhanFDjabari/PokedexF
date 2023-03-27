import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/app/utils/string_mapper.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/data/models/stat.dart';

class PokemonStatsView extends StatelessWidget {
  const PokemonStatsView(
      {required this.stats, this.textStyle, this.statAbrTextStyle, super.key});
  final List<Stat>? stats;
  final TextStyle? textStyle;
  final TextStyle? statAbrTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: stats?.map(
            (e) {
              return Container(
                margin: UIHelper.padSymmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        StringMapper.mapStatNameToAbr(e),
                        style: statAbrTextStyle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FAProgressBar(
                        backgroundColor: kGreyColor,
                        progressColor: ColorMapper.mapStatToColor(e),
                        maxValue: 100,
                        currentValue: e.baseStat?.toDouble() ?? 0.0,
                        displayText: '',
                        displayTextStyle: textStyle ??
                            const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 12),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList() ??
          [],
    );
  }
}
