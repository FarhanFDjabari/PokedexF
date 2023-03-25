import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "pokedex")
class PokemonListItemEntity extends Equatable {
  @primaryKey
  final int id;
  final String name;
  final String artworkUrl;
  final String spriteUrl;
  final int number;

  const PokemonListItemEntity(
      this.id, this.name, this.artworkUrl, this.spriteUrl, this.number);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, artworkUrl, spriteUrl, number];
}
