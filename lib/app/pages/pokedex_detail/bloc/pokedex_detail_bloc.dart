import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/entities/pokemon_entity.dart';
import 'package:pokedex_f/domain/usecases/catch_pokemon.dart';
import 'package:pokedex_f/domain/usecases/get_captured_pokemon_by_name.dart';
import 'package:pokedex_f/domain/usecases/get_pokemon_by_name.dart';
import 'package:pokedex_f/domain/usecases/release_pokemon.dart';

part 'pokedex_detail_bloc.freezed.dart';
part 'pokedex_detail_event.dart';
part 'pokedex_detail_state.dart';

@injectable
class PokedexDetailBloc extends Bloc<PokedexDetailEvent, PokedexDetailState> {
  final GetPokemonByName _getPokemonByName;
  final CatchPokemon _catchPokemon;
  final ReleasePokemon _releasePokemon;
  final GetCapturedPokemonByName _getCapturedPokemonByName;

  PokedexDetailBloc(
    this._catchPokemon,
    this._getPokemonByName,
    this._getCapturedPokemonByName,
    this._releasePokemon,
  ) : super(PokedexDetailState.initial()) {
    on<_PokedexDetailEventGetPokemon>((event, emit) async {
      final response = await _getPokemonByName.invoke(event.name);
      final isAlreadyCaught = await _isPokemonAlreadyCaught(event.name);
      response.fold(
        (l) => emit(state.copyWith(
          isLoading: false,
          message: l,
        )),
        (r) => emit(state.copyWith(
          isLoading: false,
          isAlreadyCaught: isAlreadyCaught,
          isRefreshed: true,
          pokemon: r,
        )),
      );
    });
    on<_PokedexDetailEventCatchPokemon>((event, emit) async {
      emit(state.copyWith(
        isCatching: true,
      ));
      if (event.pokemon != null) {
        await Future.delayed(const Duration(milliseconds: 3500));
        final response =
            await _catchPokemon.invoke(event.pokemon!.toItemListEntity());
        response.fold(
          (l) => emit(state.copyWith(
            isCatching: false,
          )),
          (r) => emit(state.copyWith(
            isCatching: false,
            isAlreadyCaught: true,
            isCatchOrReleaseSuccess: true,
          )),
        );
      } else {
        emit(state.copyWith(
            isCatching: false,
            isCatchOrReleaseSuccess: false,
            message: "Pokemon Data Not Found"));
      }
    });
    on<_PokedexDetailEventReleasePokemon>((event, emit) async {
      emit(state.copyWith(
        isReleasing: true,
      ));
      if (event.pokemon != null) {
        await Future.delayed(const Duration(milliseconds: 1500));
        final response =
            await _releasePokemon.invoke(event.pokemon!.toItemListEntity());
        response.fold(
          (l) => emit(state.copyWith(
            isReleasing: false,
          )),
          (r) => emit(state.copyWith(
            isReleasing: false,
            isAlreadyCaught: false,
            isCatchOrReleaseSuccess: true,
          )),
        );
      } else {
        emit(state.copyWith(
            isReleasing: false,
            isCatchOrReleaseSuccess: false,
            message: "Pokemon Data Not Found"));
      }
    });
  }

  Future<bool> _isPokemonAlreadyCaught(String name) async {
    final result = await _getCapturedPokemonByName.invoke(name);
    bool isCaught = false;
    result.fold(
      (l) => isCaught = false,
      (r) {
        if (r != null) {
          isCaught = true;
        }
      },
    );

    return isCaught;
  }
}
