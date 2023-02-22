part of 'pokedex_list_bloc.dart';

abstract class PokedexListState extends Equatable {
  const PokedexListState();
  
  @override
  List<Object> get props => [];
}

class PokedexListInitial extends PokedexListState {}
