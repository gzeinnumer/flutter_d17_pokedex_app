import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d17_pokedex_app/bloc/pokemon_detail_cubit.dart';

class NavCubit extends Cubit<int> {
  PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({required this.pokemonDetailsCubit}) : super(0);

  void showPokemonDetails(int value) {
    pokemonDetailsCubit.getPokemonDetailsDetails(value);
    emit(value);
  }

  void popToPokemon() {
    emit(0);
    pokemonDetailsCubit.clearPokemonDetails();
  }
}
