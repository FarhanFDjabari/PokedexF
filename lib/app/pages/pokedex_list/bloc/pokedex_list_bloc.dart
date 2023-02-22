import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

part 'pokedex_list_event.dart';
part 'pokedex_list_state.dart';

@injectable
class PokedexListBloc extends Bloc<PokedexListEvent, PokedexListState> {
  final PokedexRepository _repository;

  PokedexListBloc(this._repository) : super(PokedexListInitial()) {
    on<PokedexListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
