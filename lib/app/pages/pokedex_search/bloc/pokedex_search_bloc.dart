import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/domain/usecases/get_all_pokemon.dart';
// ignore: depend_on_referenced_packages
import 'package:stream_transform/stream_transform.dart';

part 'pokedex_search_event.dart';
part 'pokedex_search_state.dart';
part 'pokedex_search_bloc.freezed.dart';

@injectable
class PokedexSearchBloc extends Bloc<PokedexSearchEvent, PokedexSearchState> {
  final GetAllPokemon _getAllPokemon;

  PokedexSearchBloc(this._getAllPokemon) : super(PokedexSearchState.initial()) {
    on<_PokedexSearchEventStarted>((event, emit) async {
      final response = await _getAllPokemon.invoke(1281, 0);
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
        goToDetail: true,
        dominantColor: event.dominantColor,
        pokemonName: event.pokemonName,
      ));
    });
    on<_PokedexSearchEventSearchPokemon>(
      (event, emit) async {
        // emit loading state
        emit(state.copyWith(isLoading: true, isRefreshed: false));
        // get query from event params
        final searchQuery = event.query.toLowerCase();
        // search for query inside list of pokemons on state
        final result = state.pokemonsList
            .where(
              (element) => element.name.contains(searchQuery),
            )
            .toList();
        // add delay for 1 - 2 seconds
        await Future.delayed(const Duration(milliseconds: 1500));
        // return filtered list contained query items
        emit(state.copyWith(
          isLoading: false,
          isRefreshed: true,
          queryResult: result,
        ));
      },
      transformer: (events, mapper) {
        return events
            .debounce(const Duration(milliseconds: 1000))
            .asyncExpand(mapper);
      },
    );
  }
}
