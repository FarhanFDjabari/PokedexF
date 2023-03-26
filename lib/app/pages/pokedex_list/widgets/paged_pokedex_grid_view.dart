import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/pokedex_detail_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/pokedex_item.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/app/widgets/exception_indicator.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/injection.dart';

class PagePokedexGridView extends StatefulWidget {
  const PagePokedexGridView({required this.theme, super.key});
  final ThemeData theme;

  @override
  State<PagePokedexGridView> createState() => _PagePokedexGridViewState();
}

class _PagePokedexGridViewState extends State<PagePokedexGridView> {
  late final PokedexListBloc _pokedexListBloc;
  ThemeData get _theme => widget.theme;

  final _pagingController = PagingController<int, PokemonListItemEntity>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pokedexListBloc = getIt<PokedexListBloc>();
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _getNextPage(pageKey);
    });
  }

  void _getNextPage(int page) {
    _pokedexListBloc.add(
      PokedexListEvent.getPokemons(page),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pokedexListBloc.close();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _pokedexListBloc,
      child: BlocListener<PokedexListBloc, PokedexListState>(
        listener: (context, state) {
          if (!state.isLoading && state.isRefreshed) {
            if (state.isLastPage) {
              _pagingController.appendLastPage(state.pokemons);
            } else {
              final nextPageKey = state.currentPage + 1;
              _pagingController.appendPage(state.pokemons, nextPageKey);
            }
          } else if (state.message != null) {
            _pagingController.error = state.message;
          }
        },
        child: PagedSliverGrid(
          pagingController: _pagingController,
          showNewPageProgressIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          builderDelegate: PagedChildBuilderDelegate<PokemonListItemEntity>(
            animateTransitions: true,
            itemBuilder: (context, item, index) => FutureBuilder<Color>(
              future: ColorMapper.getDominantColor(item.spriteUrl),
              builder: (context, snapshot) => OpenContainer(
                closedColor: snapshot.data ?? _theme.colorScheme.primary,
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                closedElevation: 0,
                closedBuilder: (context, action) {
                  return PokedexItem(
                    dominantColor: snapshot.data,
                    pokedexData: item,
                    isConnectionStateWaiting:
                        snapshot.connectionState == ConnectionState.waiting,
                    theme: _theme,
                  );
                },
                openBuilder: (context, action) {
                  return PokedexDetailScreen(
                    pokemonName: item.name,
                    dominantColor: snapshot.data ?? _theme.colorScheme.primary,
                  );
                },
              ),
            ),
            firstPageProgressIndicatorBuilder: (context) => Padding(
              padding: const EdgeInsets.all(128.0),
              child: UIHelper.pokeballLoading(),
            ),
            newPageProgressIndicatorBuilder: (context) => Padding(
              padding: const EdgeInsets.all(64.0),
              child: UIHelper.pokeballLoading(),
            ),
            firstPageErrorIndicatorBuilder: (context) => ExceptionIndicator(
              title: "Error",
              message: _pagingController.error,
              onTryAgain: () => _pagingController.refresh(),
              theme: _theme,
            ),
            newPageErrorIndicatorBuilder: (context) => Container(
              width: UIHelper.mediaWidth(context, 1),
              height: 150,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Connection error, try again later",
                    style: _theme.textTheme.titleLarge?.copyWith(
                      color: _theme.colorScheme.onBackground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton.icon(
                    onPressed: () => _pagingController.refresh(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _theme.colorScheme.primary,
                      foregroundColor: _theme.colorScheme.background,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    icon: const Icon(Icons.refresh_outlined),
                    label: Text(
                      'Try Again',
                      style: _theme.textTheme.labelLarge?.copyWith(
                        color: _theme.colorScheme.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => ExceptionIndicator(
              title: "Empty",
              message: "Pokemon list empty, try again later",
              onTryAgain: () => _pagingController.refresh(),
              theme: _theme,
            ),
          ),
        ),
      ),
    );
  }
}
