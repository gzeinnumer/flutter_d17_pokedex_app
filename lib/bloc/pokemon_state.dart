import 'package:flutter_d17_pokedex_app/data/pokemon_page_response.dart';

abstract class PokemonState{}

class PokemonInitial extends PokemonState{}

class PokemonLoadInProgress extends PokemonState{}

class PokemonPageLoadSuccess extends PokemonState{
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;
  PokemonPageLoadSuccess({required this.pokemonListing, required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState{
  final Error error;

  PokemonPageLoadFailed({required this.error});
}