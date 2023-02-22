import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/domain/repositories/pokedex_repository.dart';

part 'pokedex_detail_event.dart';
part 'pokedex_detail_state.dart';

@injectable
class PokedexDetailBloc extends Bloc<PokedexDetailEvent, PokedexDetailState> {
  final PokedexRepository _repository;

  PokedexDetailBloc(this._repository) : super(PokedexDetailInitial()) {
    on<PokedexDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
