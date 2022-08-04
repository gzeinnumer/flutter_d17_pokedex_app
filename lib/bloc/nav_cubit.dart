import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int>{
  NavCubit() : super(0);

  void showPokemonDetails(int value) {
      return emit(value);
  }

  void popToPokemon(){
      return emit(0);
  }
}