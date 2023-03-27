import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/app/utils/color_mapper.dart';
import 'package:pokedex_f/domain/entities/pokemon_list_item_entity.dart';
import 'package:pokedex_f/domain/usecases/get_captured_pokemon.dart';

part 'pokeball_bloc.freezed.dart';
part 'pokeball_event.dart';
part 'pokeball_state.dart';

@injectable
class PokeballBloc extends Bloc<PokeballEvent, PokeballState> {
  final GetCapturedPokemon _getCapturedPokemon;
  StreamSubscription<List<PokemonListItemEntity>>? _pokemonsSubscription;

  PokeballBloc(this._getCapturedPokemon) : super(PokeballState.initial()) {
    on<_PokeballEventInitial>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 250));
      _pokemonsSubscription = _getCapturedPokemon.invoke().listen((event) {
        add(PokeballEvent.getCaughtPokemon(event));
      });
    });
    on<_PokeballEventGetCaughtPokemon>((event, emit) async {
      final dominantColors = await ColorMapper.getDominantColors(
        event.pokemons.map((e) => e.spriteUrl).toList(),
      );
      emit(
        state.copyWith(
          isLoading: false,
          isRefreshed: true,
          pokemons: event.pokemons,
          dominantColors: dominantColors,
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
