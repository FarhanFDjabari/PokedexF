import 'package:flutter/material.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';

class PokedexScrollViewHeader extends StatelessWidget {
  const PokedexScrollViewHeader({
    super.key,
    required this.bgImageUri,
    required this.theme,
  });

  final String bgImageUri;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 280,
        width: UIHelper.mediaWidth(context, 1),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned.fill(
              bottom: 0,
              child: ColoredBox(
                color: theme.colorScheme.primary,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                  child: Image.asset(
                    bgImageUri,
                    alignment: Alignment.center,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 30,
                width: UIHelper.mediaWidth(context, 1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    color: theme.colorScheme.background,
                  ),
                  child: Center(
                    child: SizedBox(
                      height: 5,
                      width: UIHelper.mediaWidth(context, 1) * 0.25,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kGreyColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
