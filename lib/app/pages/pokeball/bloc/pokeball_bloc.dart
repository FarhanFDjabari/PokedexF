import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';

part 'pokeball_bloc.freezed.dart';
part 'pokeball_event.dart';
part 'pokeball_state.dart';

class PokeballBloc extends Bloc<PokeballEvent, PokeballState> {
  final PokedexRepositoryImpl _repositoryImpl;
  StreamSubscription<List<PokemonListItemEntity>>? _pokemonsSubscription;

  PokeballBloc(this._repositoryImpl) : super(PokeballState.initial()) {
    on<_PokeballEventInitial>((event, emit) {
      _pokemonsSubscription =
          _repositoryImpl.getCapturedPokemon().listen((event) {
        add(PokeballEvent.getDominantColors(event));
      });
    });
    on<_PokeballEventGetDominantColors>((event, emit) {
      emit(
        state.copyWith(
          isLoading: true,
          isRefreshed: true,
          isDominantColorsRefreshed: false,
          pokemons: event.pokemons,
        ),
      );
    });
    on<_PokeballEventGetCaughtPokemon>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: false,
          isRefreshed: true,
          isDominantColorsRefreshed: true,
          pokemons: event.pokemons,
          dominantColors: event.dominantColors,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _pokemonsSubscription?.cancel();
    return super.close();
  }
}
