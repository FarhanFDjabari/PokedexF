import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_f/domain/usecases/get_pokemon_by_name.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPokemonByName usecase;
  late MockPokedexRepository mockPokedexRepository;

  setUp(() {
    mockPokedexRepository = MockPokedexRepository();
    usecase = GetPokemonByName(mockPokedexRepository);
  });

  const tName = 'bulbasaur';

  test('should get bulbasaur info from the repository', () async {
    when(mockPokedexRepository.getPokemonByName(tName))
        .thenAnswer((_) async => Right(testPokemonDetail.toEntity()));
    final result = await usecase.invoke(tName);
    expect(result, Right(testPokemonDetail.toEntity()));
  });
}
