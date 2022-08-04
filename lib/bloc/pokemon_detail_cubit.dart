import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_details.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_repository.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails>{
  final _pokemonRepository = PokemonRepository();

  PokemonDetailsCubit() : super(PokemonDetails());

  void showPokemonDetailsDetails(int value) async{
    final response = await Future.wait([
      _pokemonRepository.getPokemonInfo(value),
      _pokemonRepository.getPokemonSpeciesInfo(value)
    ]);
    final pokemonInfo = response[0];
    final pokemonSpeciesInfo = response[2];

  }

  void clearPokemonDetails(){
      return emit(PokemonDetails());
  }
}