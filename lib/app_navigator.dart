import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d17_pokedex_app/bloc/nav_cubit.dart';
import 'package:flutter_d17_pokedex_app/pokedex_view.dart';
import 'package:flutter_d17_pokedex_app/pokemon_details_vew.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(builder: (context, res) {
        return Navigator(
          pages: [
            const MaterialPage(child: PokedexView()),
            if(res != 0)
              const MaterialPage(child: PokemonDetailsView())
          ],
          onPopPage: (route, result){
            BlocProvider.of<NavCubit>(context).popToPokemon();
            return route.didPop(result);
          },
        );
    });
  }
}
