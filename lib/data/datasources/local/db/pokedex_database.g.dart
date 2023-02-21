// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorPokedexDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokedexDatabaseBuilder databaseBuilder(String name) =>
      _$PokedexDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokedexDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$PokedexDatabaseBuilder(null);
}

class _$PokedexDatabaseBuilder {
  _$PokedexDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$PokedexDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$PokedexDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<PokedexDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$PokedexDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$PokedexDatabase extends PokedexDatabase {
  _$PokedexDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PokemonListItemDao? _pokemonListItemDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PokemonListItemEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `url` TEXT NOT NULL, `number` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PokemonListItemDao get pokemonListItemDao {
    return _pokemonListItemDaoInstance ??=
        _$PokemonListItemDao(database, changeListener);
  }
}

class _$PokemonListItemDao extends PokemonListItemDao {
  _$PokemonListItemDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pokemonListItemEntityInsertionAdapter = InsertionAdapter(
            database,
            'PokemonListItemEntity',
            (PokemonListItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'url': item.url,
                  'number': item.number
                }),
        _pokemonListItemEntityDeletionAdapter = DeletionAdapter(
            database,
            'PokemonListItemEntity',
            ['id'],
            (PokemonListItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'url': item.url,
                  'number': item.number
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PokemonListItemEntity>
      _pokemonListItemEntityInsertionAdapter;

  final DeletionAdapter<PokemonListItemEntity>
      _pokemonListItemEntityDeletionAdapter;

  @override
  Future<List<PokemonListItemEntity>> findAllPokemon() async {
    return _queryAdapter.queryList('SELECT * FROM pokedex',
        mapper: (Map<String, Object?> row) => PokemonListItemEntity(
            row['id'] as int,
            row['name'] as String,
            row['url'] as String,
            row['number'] as int));
  }

  @override
  Future<PokemonListItemEntity?> findPokemonByName(String name) async {
    return _queryAdapter.query('SELECT * FROM pokedex WHERE name = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => PokemonListItemEntity(
            row['id'] as int,
            row['name'] as String,
            row['url'] as String,
            row['number'] as int),
        arguments: [name]);
  }

  @override
  Future<void> catchPokemon(PokemonListItemEntity pokemon) async {
    await _pokemonListItemEntityInsertionAdapter.insert(
        pokemon, OnConflictStrategy.abort);
  }

  @override
  Future<void> releasePokemon(PokemonListItemEntity pokemon) async {
    await _pokemonListItemEntityDeletionAdapter.delete(pokemon);
  }
}
