import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/pokedex_detail_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/pokedex_item.dart';
import 'package:pokedex_f/app/widgets/exception_indicator.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

class PagePokedexGridView extends StatefulWidget {
  const PagePokedexGridView(
      {required this.pokedexListBloc,
      required this.defaultColor,
      required this.backgroundColor,
      this.buttonTextStyle,
      this.itemTitleTextStyle,
      this.errorTextStyle,
      super.key});
  final PokedexListBloc pokedexListBloc;
  final Color defaultColor;
  final Color backgroundColor;
  final TextStyle? buttonTextStyle;
  final TextStyle? itemTitleTextStyle;
  final TextStyle? errorTextStyle;

  @override
  State<PagePokedexGridView> createState() => _PagePokedexGridViewState();
}

class _PagePokedexGridViewState extends State<PagePokedexGridView> {
  PokedexListBloc get _pokedexListBloc => widget.pokedexListBloc;
  Color get _defaultColor => widget.defaultColor;
  Color get _backgroundColor => widget.backgroundColor;
  TextStyle? get _buttonTextStyle => widget.buttonTextStyle;
  TextStyle? get _errorTextStyle => widget.errorTextStyle;
  TextStyle? get _itemTitleTextStyle => widget.itemTitleTextStyle;
  final List<Color> _dominantColors = [];

  final _pagingController = PagingController<int, PokemonListItemEntity>(
    firstPageKey: 0,
  );

  @override
  void initState() {
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
    return BlocListener<PokedexListBloc, PokedexListState>(
      listener: (context, state) {
        if (!state.isLoading &&
            state.isRefreshed &&
            state.isDominantColorsRefreshed) {
          _dominantColors.addAll(state.dominantColors);
          if (state.isLastPage) {
            _pagingController.appendLastPage(state.pokemons);
          } else {
            final nextPageKey = state.currentPage + 1;
            _pagingController.appendPage(state.pokemons, nextPageKey);
          }
        } else if (state.isRefreshed && !state.isDominantColorsRefreshed) {
          _pokedexListBloc.add(PokedexListEvent.getDominantColors(
            state.pokemons,
            state.dominantColors,
          ));
        } else if (state.message != null) {
          _pagingController.error = state.message;
        }
      },
      child: BlocBuilder<PokedexListBloc, PokedexListState>(
          builder: (context, state) {
        return PagedSliverGrid(
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
            itemBuilder: (context, item, index) => OpenContainer(
              key: Key('pokemon.${item.name}'),
              closedColor: _dominantColors[index],
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              closedElevation: 0,
              closedBuilder: (context, action) {
                return PokedexItem(
                  dominantColor: _dominantColors[index],
                  pokedexData: item,
                  backgroundColor: _backgroundColor,
                  textStyle: _itemTitleTextStyle,
                );
              },
              openBuilder: (context, action) {
                return PokedexDetailScreen(
                  pokemonName: item.name,
                  dominantColor: _dominantColors[index],
                );
              },
            ),
            firstPageProgressIndicatorBuilder: (context) => Padding(
              padding: UIHelper.padAll(
                128.0,
                cwBottom: 128,
                cwTop: 128,
                cwRight: 128,
                cwLeft: 128,
              ),
              child: UIHelper.pokeballLoading(),
            ),
            newPageProgressIndicatorBuilder: (context) => Padding(
              padding: UIHelper.padAll(64.0, cwBottom: 64.0),
              child: UIHelper.pokeballLoading(),
            ),
            firstPageErrorIndicatorBuilder: (context) => ExceptionIndicator(
              title: "Error",
              message: _pagingController.error,
              onTryAgain: () => _pagingController.refresh(),
              titleTextStyle: _errorTextStyle,
            ),
            newPageErrorIndicatorBuilder: (context) => Container(
              width: UIHelper.mediaWidth(context, 1),
              height: 150,
              padding: UIHelper.padAll(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Connection error, try again later",
                    style: _errorTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton.icon(
                    onPressed: () => _pagingController.refresh(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _defaultColor,
                      foregroundColor: _backgroundColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    icon: const Icon(Icons.refresh_outlined),
                    label: Text(
                      'Try Again',
                      style: _buttonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => ExceptionIndicator(
              title: "Empty",
              message: "Pokemon list empty, try again later",
              onTryAgain: () => _pagingController.refresh(),
              titleTextStyle: _errorTextStyle,
            ),
          ),
        );
      }),
    );
  }
}
