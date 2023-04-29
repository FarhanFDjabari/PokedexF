import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:stream_transform/stream_transform.dart';

part 'pokedex_search_event.dart';
part 'pokedex_search_state.dart';
part 'pokedex_search_bloc.freezed.dart';

class PokedexSearchBloc extends Bloc<PokedexSearchEvent, PokedexSearchState> {
  final PokedexRepositoryImpl _repositoryImpl;

  PokedexSearchBloc(this._repositoryImpl)
      : super(PokedexSearchState.initial()) {
    on<_PokedexSearchEventStarted>((event, emit) async {
      final response = await _repositoryImpl.getAllPokemon(1281, 0);
      response.fold(
        (l) => emit(state.copyWith(
          isLoading: false,
          message: l,
        )),
        (r) => emit(state.copyWith(
          isLoading: false,
          isRefreshed: true,
          pokemonsList: r.results?.map((e) => e.toEntity()).toList() ?? [],
        )),
      );
    });
    on<_PokedexSearchEventToDetail>((event, emit) async {
      emit(state.copyWith(
        goToDetail: false,
      ));
      emit(state.copyWith(
        goToDetail: true,
        dominantColor: event.dominantColor,
        pokemonName: event.pokemonName,
      ));
    });
    on<_PokedexSearchEventSearchPokemon>(
      (event, emit) async {
        // get query from event params
        final searchQuery = event.query.toLowerCase();
        // check if query is not empty
        if (searchQuery.isEmpty) {
          return;
        }
        // emit loading state
        emit(state.copyWith(
          isLoading: true,
          isRefreshed: false,
          isDominantColorsRefreshed: false,
          goToDetail: false,
        ));
        // search for query inside list of pokemons on state
        final result = state.pokemonsList
            .where(
              (element) => element.name.contains(searchQuery),
            )
            .toList();
        // return filtered list contained query items
        emit(state.copyWith(
          isLoading: false,
          isRefreshed: true,
          isDominantColorsRefreshed: false,
          queryResult: result,
        ));
      },
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 1000))
            .asyncExpand(mapper);
      },
    );
    on<_PokedexSearchEventSearchDominantColors>(
      (event, emit) async {
        emit(state.copyWith(
          isLoading: true,
          isRefreshed: false,
          goToDetail: false,
        ));
        emit(state.copyWith(
          isLoading: false,
          isRefreshed: true,
          isDominantColorsRefreshed: true,
          queryResult: event.containedPokemons,
          dominantColorsData: event.containedDominantColors,
        ));
      },
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 500))
            .asyncExpand(mapper);
      },
    );
  }
}
