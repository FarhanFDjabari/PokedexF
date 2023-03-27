import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_f/app/pages/pokedex_search/bloc/pokedex_search_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_search/widgets/pokedex_search_result_header.dart';
import 'package:pokedex_f/app/pages/pokedex_search/widgets/pokedex_search_result_tile.dart';
import 'package:pokedex_f/app/routes/route_path.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/injection.dart';

class PokedexSearchScreen extends StatefulWidget {
  const PokedexSearchScreen({super.key});

  @override
  State<PokedexSearchScreen> createState() => _PokedexSearchScreenState();
}

class _PokedexSearchScreenState extends State<PokedexSearchScreen> {
  late final PokedexSearchBloc _pokedexSearchBloc;
  late final TextEditingController _queryController;

  @override
  void initState() {
    _queryController = TextEditingController();
    _pokedexSearchBloc = getIt<PokedexSearchBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _pokedexSearchBloc.close();
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider<PokedexSearchBloc>(
      create: (context) =>
          _pokedexSearchBloc..add(const PokedexSearchEvent.started()),
      child: Builder(builder: (context) {
        return BlocListener<PokedexSearchBloc, PokedexSearchState>(
          listener: (context, state) {
            if (state.goToDetail) {
              context.push(
                "${RoutePath.pokedexScreen}/pokemon/${state.pokemonName}",
                extra: state.dominantColor,
              );
            }
          },
          child: Scaffold(
            backgroundColor: theme.colorScheme.background,
            body: SafeArea(
              child: Material(
                color: theme.colorScheme.background,
                child: BlocBuilder<PokedexSearchBloc, PokedexSearchState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Padding(
                          padding: UIHelper.padAll(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackButton(
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _queryController,
                                  autofocus: false,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: 'Search pokemon',
                                  ),
                                  textInputAction: TextInputAction.search,
                                  keyboardType: TextInputType.name,
                                  onChanged: (value) {
                                    context.read<PokedexSearchBloc>().add(
                                        PokedexSearchEvent.searchPokemon(
                                            value));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(thickness: 1),
                        if (state.isLoading)
                          Expanded(
                            child: Center(
                              child: UIHelper.pokeballLoading(
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        if (!state.isLoading && state.isRefreshed)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (state.queryResult.isNotEmpty)
                                  PokedexSearchResultHeader(
                                    title: 'SEARCH RESULTS',
                                    textStyle: theme.textTheme.labelMedium,
                                  ),
                                if (state.queryResult.isEmpty)
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        UIHelper.assetImageLoader(
                                          assetUri:
                                              "assets/images/pokedex_icon_placeholder.png",
                                          width: 150,
                                          height: 150,
                                          color: theme.colorScheme.onBackground,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "No Search Result",
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (state.queryResult.isNotEmpty)
                                  Expanded(
                                    child: ListView.separated(
                                      padding: UIHelper.padLTRB(
                                        16.0,
                                        0,
                                        16.0,
                                        16.0,
                                        cwRight: 16.0,
                                        cwLeft: 16.0,
                                      ),
                                      itemBuilder: (context, index) {
                                        final pokemon =
                                            state.queryResult[index];
                                        return PokedexSearchResultTile(
                                          title: pokemon.name,
                                          imageUrl: pokemon.artworkUrl,
                                          number: pokemon.number,
                                          dominantColor:
                                              state.dominantColorsData[index],
                                          defaultColor: kGreyColor,
                                          textStyle: theme.textTheme.labelLarge
                                              ?.copyWith(
                                            color:
                                                theme.colorScheme.onBackground,
                                          ),
                                          onTap: () {
                                            context
                                                .read<PokedexSearchBloc>()
                                                .add(
                                                  PokedexSearchEvent.toDetail(
                                                    pokemon.name,
                                                    state.dominantColorsData[
                                                        index],
                                                  ),
                                                );
                                          },
                                        );
                                      },
                                      itemCount: state.queryResult.length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 5),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
