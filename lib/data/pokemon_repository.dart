import 'dart:convert';

import 'package:flutter_d17_pokedex_app/data/pokemon_info_response.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_page_response.dart';
import 'package:flutter_d17_pokedex_app/data/pokemon_spesies_info_response.dart';
import 'package:http/http.dart' as http;

class PokemonRepository{
  final _baseUrl = "pokeapi.co";
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async{
    //pokemon?limit=200&offset=400

    final queryParameters = {
      "limit" : "200",
      "offset" : (pageIndex * 200).toString()
    };

    final uri = Uri.https(_baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int id) async{
    final url = Uri.https(_baseUrl, '/api/v2/pokemon/$id');
    try{
      final response = await client.get(url);
      final json = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } on Error catch(e){
      throw e;
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(int id) async{
    final url = Uri.https(_baseUrl, '/api/v2/pokemon-species/$id');
    try{
        final response = await client.get(url);
        final json = jsonDecode(response.body);
        return PokemonSpeciesInfoResponse.fromJson(json);
    } on Error catch(e){
        throw e;
    }
  }
}