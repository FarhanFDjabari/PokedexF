import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_f/app/pages/pokedex_detail/pokedex_detail_screen.dart';
import 'package:pokedex_f/app/pages/pokedex_list/bloc/pokedex_list_bloc.dart';
import 'package:pokedex_f/app/pages/pokedex_list/widgets/pokedex_item.dart';
import 'package:pokedex_f/app/routes/route_name.dart';
import 'package:pokedex_f/app/routes/route_path.dart';
import 'package:pokedex_f/app/styles/colors.dart';
import 'package:pokedex_f/app/widgets/exception_indicator.dart';
import 'package:pokedex_f/app/widgets/ui_helper.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/injection.dart';

class PagePokedexGridView extends StatefulWidget {
  const PagePokedexGridView({super.key});

  @override
  State<PagePokedexGridView> createState() => _PagePokedexGridViewState();
}

class _PagePokedexGridViewState extends State<PagePokedexGridView> {
  late final _pokedexListBloc = getIt<PokedexListBloc>();

  final _pagingController = PagingController<int, PokemonListItemEntity>(
    firstPageKey: 1,
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

  Future<Color> _getDominantColor(String imageUrl) async {
    final paletteData = await PaletteGenerator.fromImageProvider(
      Image.network(imageUrl).image,
    );

    return paletteData.lightVibrantColor?.color ?? kGreyColor;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _pokedexListBloc,
      child: BlocListener<PokedexListBloc, PokedexListState>(
        listener: (context, state) {
          if (state.isRefreshed) {
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          builderDelegate: PagedChildBuilderDelegate<PokemonListItemEntity>(
            animateTransitions: true,
            firstPageProgressIndicatorBuilder: (context) => Padding(
              padding: const EdgeInsets.all(128.0),
              child: UIHelper.pokeballLoading(),
            ),
            newPageProgressIndicatorBuilder: (context) => Padding(
              padding: const EdgeInsets.all(128.0),
              child: UIHelper.pokeballLoading(),
            ),
            itemBuilder: (context, item, index) => FutureBuilder<Color>(
              future: _getDominantColor(item.url),
              builder: (context, snapshot) => OpenContainer(
                closedColor:
                    snapshot.data ?? Theme.of(context).colorScheme.primary,
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
                    onTap: () {
                      // context.go(
                      //   "${RoutePath.pokedexScreen}/${item.name}",
                      //   extra:
                      //       snapshot.data ?? Theme.of(context).colorScheme.primary,
                      // );
                    },
                  );
                },
                openBuilder: (context, action) {
                  return PokedexDetailScreen(
                    pokemonName: item.name,
                    dominantColor:
                        snapshot.data ?? Theme.of(context).colorScheme.primary,
                  );
                },
              ),
            ),
            firstPageErrorIndicatorBuilder: (context) => ExceptionIndicator(
              title: "Error",
              message: _pagingController.error,
              onTryAgain: () => _pagingController.refresh(),
            ),
            newPageErrorIndicatorBuilder: (context) => const Text(
              "an Error Occured, Please Try Again",
            ),
            noItemsFoundIndicatorBuilder: (context) => ExceptionIndicator(
              title: "Empty",
              message: "Pokemon list empty, try again later",
              onTryAgain: () => _pagingController.refresh(),
            ),
          ),
        ),
      ),
    );
  }
}
