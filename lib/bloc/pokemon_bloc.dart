import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d17_pokedex_app/bloc/pokemon_event.dart';
import 'package:flutter_d17_pokedex_app/bloc/pokemon_state.dart';

import 'package:flutter_d17_pokedex_app/data/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepostory = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPageResponse = await _pokemonRepostory.getPokemonPage(event.page);
        yield PokemonPageLoadSuccess(
            pokemonListing: pokemonPageResponse.pokemonListings,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage);
      } on Error catch (e) {
        yield PokemonPageLoadFailed(error: e);
      }
    }
  }
}
