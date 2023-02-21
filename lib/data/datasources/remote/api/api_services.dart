import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_f/data/models/pokemon.dart';
import 'package:pokedex_f/data/models/pokemon_list.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  // static Future<ApiServices> create({
  //   Map<String, dynamic> headers = const {},
  //   int connectTimeout = 30000,
  //   int receiveTimeout = 30000,
  // }) async {

  // }

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
