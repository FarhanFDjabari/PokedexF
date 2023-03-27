import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/domain/usecases/get_all_pokemon.dart';

part 'pokedex_list_bloc.freezed.dart';
part 'pokedex_list_event.dart';
part 'pokedex_list_state.dart';

@injectable
class PokedexListBloc extends Bloc<PokedexListEvent, PokedexListState> {
  final GetAllPokemon _getAllPokemon;

  PokedexListBloc(this._getAllPokemon) : super(PokedexListState.initial()) {
    on<_PokedexListEventGetPokemons>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isRefreshed: false,
        isDominantColorsRefreshed: false,
        goToSearch: false,
      ));
      final response = await _getAllPokemon.invoke(20, event.page * 20);
      response.fold(
        (l) => emit(
          state.copyWith(
            isLoading: false,
            isRefreshed: false,
            isDominantColorsRefreshed: false,
            isFirstPage: false,
            goToSearch: false,
            message: l,
            pokemons: [],
            currentPage: event.page,
          ),
        ),
        (r) => emit(
          state.copyWith(
            isRefreshed: true,
            isDominantColorsRefreshed: false,
            message: null,
            goToSearch: false,
            isLastPage: r.next == null,
            isFirstPage: r.previous == null,
            currentPage: event.page,
            pokemons: r.results?.map((e) => e.toEntity()).toList() ?? [],
          ),
        ),
      );
    });
    on<_PokedexListEventGoToSearch>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        goToSearch: false,
      ));
      emit(state.copyWith(
        isLoading: false,
        goToSearch: true,
      ));
    });
    on<_PokedexListEventGetDominantColors>((event, emit) async {
      emit(state.copyWith(
        isDominantColorsRefreshed: false,
      ));
      final colors = await ColorMapper.getDominantColors(
        event.pokemons.map((e) => e.spriteUrl).toList(),
      );
      emit(state.copyWith(
        isLoading: false,
        isDominantColorsRefreshed: true,
        dominantColors: colors,
      ));
    });
  }
}
