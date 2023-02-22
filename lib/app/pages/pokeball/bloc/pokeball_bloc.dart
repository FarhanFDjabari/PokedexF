import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

part 'pokeball_event.dart';
part 'pokeball_state.dart';

@injectable
class PokeballBloc extends Bloc<PokeballEvent, PokeballState> {
  final PokedexRepository _repository;

  PokeballBloc(this._repository) : super(PokeballInitial()) {
    on<PokeballEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
