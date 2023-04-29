import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/pokedex_detail_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/pokedex_item.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar_title_action.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/pokedex_scroll_view_header.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/di/injection.dart';

class PokeballScreen extends StatefulWidget {
  const PokeballScreen({super.key});

  @override
  State<PokeballScreen> createState() => _PokeballScreenState();
}

class _PokeballScreenState extends State<PokeballScreen> with CollapseMixin {
  late final ScrollController _scrollController;
  PokeballBloc get _pokeballBloc => Injector.resolve<PokeballBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    listenCollapse(controller: _scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return BlocProvider(
      create: (context) => _pokeballBloc..add(const PokeballEvent.initial()),
      child: Builder(builder: (context) {
        return BlocListener<PokeballBloc, PokeballState>(
          listener: (context, state) async {
            if (state.isLoading &&
                state.isRefreshed &&
                !state.isDominantColorsRefreshed) {
              context.read<PokeballBloc>().add(PokeballEvent.getCaughtPokemon(
                  state.pokemons,
                  await ColorMapper.getDominantColors(
                    state.pokemons.map((e) => e.spriteUrl).toList(),
                  )));
            }
          },
          child: Scaffold(
            backgroundColor: theme.colorScheme.background,
            primary: false,
            extendBodyBehindAppBar: true,
            appBar: CollapseAppBarTitleAction(
              size: UIHelper.appBarSize(context),
              controller: _scrollController,
              title: 'Pokeball',
              isCenterTitle: false,
              actions: const [],
              isCollapse: isCollapse,
              backgroundColor: const Color(0xFF2C0C3C),
              titleTextStyle: theme.textTheme.titleMedium,
              defaultColor: theme.colorScheme.primary,
            ),
            body: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                PokedexScrollViewHeader(
                  bgImageUri: "assets/images/pokeball_overlay.png",
                  bgImageUriDark: "assets/images/greatball_overlay.png",
                  isDarkMode: brightness == Brightness.dark,
                  backgroundColor: theme.colorScheme.background,
                ),
                BlocBuilder<PokeballBloc, PokeballState>(
                    builder: (context, state) {
                  if (state.message != null) {
                    return SliverFillRemaining(
                      child: Container(
                        padding: UIHelper.padAll(16),
                        child: Text(
                          "${state.message}",
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    );
                  } else if (state.isRefreshed &&
                      state.isDominantColorsRefreshed) {
                    return SliverPadding(
                      padding: UIHelper.padAll(
                        16,
                        cwLeft: 16,
                        cwRight: 16,
                        cwBottom: 32,
                      ),
                      sliver: state.pokemons.isEmpty
                          ? SliverFillRemaining(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  UIHelper.assetImageLoader(
                                    assetUri:
                                        "assets/images/pikachu_placeholder_icon.png",
                                    color: theme.colorScheme.onBackground,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "No Pokemon Captured Yet",
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => OpenContainer(
                                  closedColor: state.dominantColors[index],
                                  closedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  closedElevation: 0,
                                  closedBuilder: (context, action) {
                                    return PokedexItem(
                                      dominantColor:
                                          state.dominantColors[index],
                                      pokedexData: state.pokemons[index],
                                      backgroundColor:
                                          theme.colorScheme.background,
                                      textStyle:
                                          theme.textTheme.titleSmall?.copyWith(
                                        color: theme.colorScheme.onBackground,
                                      ),
                                    );
                                  },
                                  openBuilder: (context, action) {
                                    return PokedexDetailScreen(
                                      pokemonName: state.pokemons[index].name,
                                      dominantColor:
                                          state.dominantColors[index],
                                    );
                                  },
                                ),
                                childCount: state.pokemons.length,
                              ),
                            ),
                    );
                  }
                  return SliverFillRemaining(
                    child: Center(
                      child: UIHelper.pokeballLoading(
                        height: 25,
                        width: 25,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
