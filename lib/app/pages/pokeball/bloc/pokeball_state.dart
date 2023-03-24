part of 'pokeball_bloc.dart';

abstract class PokeballState extends Equatable {
  const PokeballState();

  @override
  List<Object> get props => [];
}

class PokeballInitial extends PokeballState {}
