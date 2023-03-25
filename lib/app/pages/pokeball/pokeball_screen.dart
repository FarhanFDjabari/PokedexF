import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_f/app/pages/pokeball/bloc/pokeball_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/pokedex_detail_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/pokedex_item.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar_title_action.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/pokedex_scroll_view_header.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/injection.dart';

class PokeballScreen extends StatefulWidget {
  const PokeballScreen({super.key});

  @override
  State<PokeballScreen> createState() => _PokeballScreenState();
}

class _PokeballScreenState extends State<PokeballScreen> with CollapseMixin {
  late final ScrollController _scrollController;

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
    return BlocProvider(
      create: (context) =>
          getIt<PokeballBloc>()..add(const PokeballEvent.initial()),
      child: Builder(builder: (context) {
        return BlocListener<PokeballBloc, PokeballState>(
          listener: (context, state) {},
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            extendBodyBehindAppBar: true,
            appBar: CollapseAppBarTitleAction(
              size: UIHelper.appBarSize(context),
              controller: _scrollController,
              title: 'Pokeball',
              isCenterTitle: false,
              actions: const [],
              isCollapse: isCollapse,
            ),
            body: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                const PokedexScrollViewHeader(
                  bgImageUri: "assets/images/pokeball_overlay.png",
                ),
                BlocBuilder<PokeballBloc, PokeballState>(
                    builder: (context, state) {
                  if (state.message != null) {
                    return SliverFillRemaining(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "${state.message}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ),
                    );
                  } else if (state.isRefreshed) {
                    return SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: state.pokemons.isEmpty
                          ? SliverFillRemaining(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/pikachu_placeholder_icon.png",
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "No Pokemon Captured Yet",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
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
                                      isConnectionStateWaiting: false,
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
