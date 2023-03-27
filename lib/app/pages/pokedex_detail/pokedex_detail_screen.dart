import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/bloc/pokedex_detail_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/capture_release_pokemon_dialog.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/pokemon_size_view.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/pokemon_stats_view.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/widgets/pokemon_type_view.dart';
import 'package:pokedex_f/app/utils/color_brightness_ext.dart';
import 'package:pokedex_f/app/widgets/collapse_app_bar_title_action.dart';
import 'package:pokedex_f/app/widgets/collapse_mixin.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/domain/entities/pokemon_entity.dart';
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
  late final PokedexDetailBloc _pokedexDetailBloc;
  Color get _dominantColor => widget.dominantColor;
  String get _pokemonName => widget.pokemonName;

  @override
  void initState() {
    super.initState();
    _pokedexDetailBloc = getIt<PokedexDetailBloc>();
    _scrollController = ScrollController();
    listenCollapse(controller: _scrollController);
  }

  @override
  void dispose() {
    _pokedexDetailBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  void showSnackbar(BuildContext context, PokemonEntity? pokemon,
      bool isAlreadyCaught, ThemeData theme) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: theme.colorScheme.primary,
            )),
        content: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: isAlreadyCaught ? 'You catched ' : 'Bye, ',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
              TextSpan(
                text: '${toBeginningOfSentenceCase(pokemon?.name)}',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: _dominantColor.darken(0.4),
                ),
              ),
              TextSpan(
                text: '!',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: theme.colorScheme.background,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) =>
          _pokedexDetailBloc..add(PokedexDetailEvent.getPokemon(_pokemonName)),
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
              showSnackbar(
                  context, state.pokemon, state.isAlreadyCaught, theme);
            }
          },
          child: Scaffold(
            backgroundColor: theme.colorScheme.background,
            appBar: CollapseAppBarTitleAction(
              controller: _scrollController,
              isCollapse: isCollapse,
              dominantColor: _dominantColor,
              size: UIHelper.appBarSize(context),
              title: "Pokedex",
              backgroundColor: theme.colorScheme.background,
              defaultColor: theme.colorScheme.primary,
              titleTextStyle: theme.textTheme.titleMedium,
              actions: [
                BlocBuilder<PokedexDetailBloc, PokedexDetailState>(
                  builder: (context, state) {
                    return Text(
                      state.isRefreshed
                          ? sprintf("#%03d", [state.pokemon?.id])
                          : '',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: isCollapse
                            ? theme.colorScheme.onBackground
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
                                ? theme.colorScheme.onBackground
                                : _dominantColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.5, 1.0],
                        ),
                      ),
                      child: Center(
                        child: !state.isLoading
                            ? UIHelper.networkImageLoader(
                                imageUrl:
                                    "${state.pokemon?.sprites?.other?.officialArtwork?.frontDefault}",
                                scale: 2.5,
                                useLoadingBuilder: true,
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
                                  padding: UIHelper.padSymmetric(
                                    horizontal: 32,
                                  ),
                                  child: Text(
                                    "${state.message}",
                                    softWrap: true,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onBackground,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: UIHelper.padAll(
                                  16.0,
                                  cwTop: 16,
                                  cwLeft: 16,
                                  cwRight: 16,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "${toBeginningOfSentenceCase(state.pokemon?.name)}",
                                      style: theme.textTheme.titleLarge,
                                    ),
                                    const SizedBox(height: 15),
                                    PokemonTypeView(
                                      types: state.pokemon?.types,
                                      textStyle:
                                          theme.textTheme.labelLarge?.copyWith(
                                        color: theme.colorScheme.onBackground,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    PokemonSizeView(
                                      weight: state.pokemon?.weight,
                                      height: state.pokemon?.height,
                                      valueTextStyle: theme
                                          .textTheme.headlineSmall
                                          ?.copyWith(
                                        color: theme.colorScheme.onBackground,
                                      ),
                                      titleTextStyle:
                                          theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.onBackground,
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Text(
                                      'Base Stats',
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        color: theme.colorScheme.onBackground,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    PokemonStatsView(
                                      stats: state.pokemon?.stats,
                                      statAbrTextStyle:
                                          theme.textTheme.bodySmall,
                                      textStyle:
                                          theme.textTheme.labelMedium?.copyWith(
                                        color: theme.colorScheme.onBackground,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        backgroundColor:
                                            theme.colorScheme.primary,
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
                                      icon: UIHelper.assetImageLoader(
                                        assetUri: state.isAlreadyCaught
                                            ? 'assets/images/open_pokeball_icon.png'
                                            : 'assets/images/pokeball_overlay_bg_frame.png',
                                        color: theme.colorScheme.background,
                                        width: 25,
                                        height: 25,
                                      ),
                                      label: Text(
                                        state.isAlreadyCaught
                                            ? 'Release Pokemon'
                                            : 'Capture Pokemon',
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(
                                          color: theme.colorScheme.background,
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
