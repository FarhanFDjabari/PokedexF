import 'package:mockito/annotations.dart';
import 'package:pokedex_f/data/datasources/local/dao/pokemon_list_item_dao.dart';
import 'package:pokedex_f/data/datasources/local/pokedex_local_datasource.dart';
import 'package:pokedex_f/data/datasources/remote/api/api_services.dart';
import 'package:pokedex_f/data/datasources/remote/pokedex_remote_datasource.dart';
import 'package:pokedex_f/data/repositories/pokedex_repository_impl.dart';

@GenerateMocks([
  PokedexRepositoryImpl,
  PokemonListItemDao,
  ApiServices,
], customMocks: [
  MockSpec<PokedexLocalDatasource>(
    as: #MockPokedexLocalDatasource,
  ),
  MockSpec<PokedexRemoteDatasource>(
    as: #MockPokedexRemoteDatasource,
  ),
])
void main() {}
