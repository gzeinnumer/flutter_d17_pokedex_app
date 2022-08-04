import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_details.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_info_response.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_repository.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_spesies_info_response.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails>{
  final _pokemonRepository = PokemonRepository();

  PokemonDetailsCubit() : super(PokemonDetails());

  void getPokemonDetailsDetails(int value) async{
    final response = await Future.wait([
      _pokemonRepository.getPokemonInfo(value),
      _pokemonRepository.getPokemonSpeciesInfo(value)
    ]);
    final pokemonInfo = response[0] as PokemonInfoResponse;
    final pokemonSpeciesInfo = response[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: pokemonSpeciesInfo.description
    ));
  }

  void clearPokemonDetails(){
      return emit(PokemonDetails());
  }
}