import 'package:flutter/material.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';

class PokedexScrollViewHeader extends StatelessWidget {
  const PokedexScrollViewHeader({
    super.key,
    required this.bgImageUri,
    this.bgImageUriDark,
    this.isDarkMode = false,
    required this.backgroundColor,
  });

  final String bgImageUri;
  final String? bgImageUriDark;
  final Color backgroundColor;
  final bool isDarkMode;

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
                color: backgroundColor,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                  child: UIHelper.assetImageLoader(
                    assetUri: isDarkMode
                        ? (bgImageUriDark ?? bgImageUri)
                        : bgImageUri,
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
                    color: backgroundColor,
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
