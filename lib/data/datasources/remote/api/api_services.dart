import 'package:dio/dio.dart';
import 'package:pokedex_f/data/models/pokemon.dart';
import 'package:pokedex_f/data/models/pokemon_list.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET('pokemon')
  Future<PokemonList> getAllPokemon({
    @Query("limit") int limit = 20,
    @Query("offset") int offset = 20,
  });

  @GET('pokemon/{name}')
  Future<Pokemon> getPokemonByName({
    @Path("name") required String pokemonName,
  });
}
