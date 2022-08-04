import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_d17_pokedex_app/bloc/pokemon_event.dart';
import 'package:flutter_d17_pokedex_app/pokedex_view.dart';

import 'bloc/pokemon_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
          providers: [
              BlocProvider<PokemonBloc>(create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0)))
          ],
          child: PokedexView(),
      ),
    );
  }
}
