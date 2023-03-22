part of 'pokedex_list_bloc.dart';

@freezed
class PokedexListEvent with _$PokedexListEvent {
  const factory PokedexListEvent.initial() = _PokedexListEventInitial;
  const factory PokedexListEvent.getPokemons(int page) =
      _PokedexListEventGetPokemons;
}
