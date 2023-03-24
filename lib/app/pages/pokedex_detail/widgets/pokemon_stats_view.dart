import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/app/utils/string_mapper.dart';
import 'package:pokedex_f/data/models/stat.dart';

class PokemonStatsView extends StatelessWidget {
  const PokemonStatsView({required this.stats, super.key});
  final List<Stat>? stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: stats?.map(
            (e) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        StringMapper.mapStatNameToAbr(e),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FAProgressBar(
                        backgroundColor: kGreyColor,
                        progressColor: ColorMapper.mapStatToColor(e),
                        maxValue: 100,
                        currentValue: e.baseStat?.toDouble() ?? 0.0,
                        displayText: ' / 100',
                        displayTextStyle:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ) ??
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
