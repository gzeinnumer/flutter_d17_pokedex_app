import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_bloc.dart';
import 'bloc/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Pokedex"),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
        if (state is PokemonLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PokemonPageLoadSuccess) {
          return GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: state.pokemonListing.length,
            itemBuilder: (context, index) {
              return Card(
                child: GridTile(
                  child: Column(
                    children: [
                      Image.network(state.pokemonListing[index].imageUrl),
                      Text(state.pokemonListing[index].name)
                    ],
                  ),
                ),
              );
            },
          );
        } else if(state is PokemonPageLoadFailed){
          return Center(
            child: Text(state.error.toString()),
          );
        } else{
          return Container();
        }
      }),
    );
  }
}
