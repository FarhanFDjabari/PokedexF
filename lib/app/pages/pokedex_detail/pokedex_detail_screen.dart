import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/capture_release_pokemon_dialog.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/pokemon_size_view.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/pokemon_stats_view.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/pokemon_type_view.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar_title_action.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/injection.dart';
import 'package:sprintf/sprintf.dart';

class PokedexDetailScreen extends StatefulWidget {
  final String pokemonName;
  final Color dominantColor;
  const PokedexDetailScreen({
    required this.pokemonName,
    required this.dominantColor,
    super.key,
  });

  @override
  State<PokedexDetailScreen> createState() => _PokedexDetailScreenState();
}

class _PokedexDetailScreenState extends State<PokedexDetailScreen>
    with CollapseMixin {
  late final ScrollController _scrollController;
  Color get _dominantColor => widget.dominantColor;
  String get _pokemonName => widget.pokemonName;

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
      create: (context) => getIt<PokedexDetailBloc>()
        ..add(PokedexDetailEvent.getPokemon(_pokemonName)),
      child: Builder(builder: (context) {
        return BlocListener<PokedexDetailBloc, PokedexDetailState>(
          listener: (context, state) async {
            if (state.isCatching) {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => CaptureReleasePokemonDialog(
                  imageUrl: '${state.pokemon?.sprites?.frontDefault}',
                  name: '${state.pokemon?.name}',
                  isCapture: true,
                ),
              );
            } else if (state.isReleasing) {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => CaptureReleasePokemonDialog(
                  imageUrl: '${state.pokemon?.sprites?.frontDefault}',
                  name: '${state.pokemon?.name}',
                  isCapture: false,
                  durationInSeconds: 1,
                ),
              );
            } else if (state.isCatchOrReleaseSuccess) {
              context.pop();
            }
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: CollapseAppBarTitleAction(
              controller: _scrollController,
              isCollapse: isCollapse,
              dominantColor: _dominantColor,
              size: UIHelper.appBarSize(context),
              title: "Pokedex",
              actions: [
                BlocBuilder<PokedexDetailBloc, PokedexDetailState>(
                  builder: (context, state) {
                    return Text(
                      state.isRefreshed
                          ? sprintf("#%03d", [state.pokemon?.id])
                          : '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: isCollapse
                                ? Theme.of(context).colorScheme.onBackground
                                : Colors.white,
                          ),
                    );
                  },
                ),
              ],
            ),
            extendBodyBehindAppBar: true,
            body: BlocBuilder<PokedexDetailBloc, PokedexDetailState>(
                builder: (context, state) {
              return CustomScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            _dominantColor,
                            !state.isLoading
                                ? Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.75)
                                : _dominantColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.5, 1.0],
                        ),
                      ),
                      child: Center(
                        child: !state.isLoading
                            ? Image.network(
                                "${state.pokemon?.sprites?.other?.officialArtwork?.frontDefault}",
                                scale: 2.5,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }

                                  return Center(
                                    child: CircularProgressIndicator.adaptive(
                                      strokeWidth: 3,
                                      value: loadingProgress
                                              .cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1),
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(
                                      "assets/images/pikachu_placeholder_icon.png",
                                    ),
                                  );
                                },
                              )
                            : UIHelper.pokeballLoading(
                                height: 25,
                                width: 25,
                              ),
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: state.isLoading
                        ? Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: UIHelper.pokeballLoading(),
                            ),
                          )
                        : state.message != null
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                  ),
                                  child: Text(
                                    "${state.message}",
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "${toBeginningOfSentenceCase(state.pokemon?.name)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    const SizedBox(height: 15),
                                    PokemonTypeView(
                                      types: state.pokemon?.types,
                                    ),
                                    const SizedBox(height: 25),
                                    PokemonSizeView(
                                      weight: state.pokemon?.weight,
                                      height: state.pokemon?.height,
                                    ),
                                    const SizedBox(height: 25),
                                    Text(
                                      'Base Stats',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                    ),
                                    const SizedBox(height: 5),
                                    PokemonStatsView(
                                      stats: state.pokemon?.stats,
                                    ),
                                    const SizedBox(height: 15),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      onPressed: () async {
                                        if (state.isAlreadyCaught) {
                                          context.read<PokedexDetailBloc>().add(
                                                PokedexDetailEvent
                                                    .releasePokemon(
                                                  state.pokemon,
                                                ),
                                              );
                                        } else {
                                          context.read<PokedexDetailBloc>().add(
                                                PokedexDetailEvent.catchPokemon(
                                                  state.pokemon,
                                                ),
                                              );
                                        }
                                      },
                                      icon: Image.asset(
                                        state.isAlreadyCaught
                                            ? 'assets/images/open_pokeball_icon.png'
                                            : 'assets/images/pokeball_overlay_bg_frame.png',
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        width: 25,
                                        height: 25,
                                      ),
                                      label: Text(
                                        state.isAlreadyCaught
                                            ? 'Release Pokemon'
                                            : 'Capture Pokemon',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                  ),
                ],
              );
            }),
          ),
        );
      }),
    );
  }
}
