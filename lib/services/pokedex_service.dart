import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokedex_app/models/pokemon_list_model.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class PokedexService {
  final fetchAllUrl = "http://pokeapi.co/api/v2/pokemon/?limit=50";
  final offsetUrl = "";

  Future<PokemonListModel> getPokemon() async {
    try {
      final response = await http.get(fetchAllUrl);
      PokemonListModel pokemon = PokemonListModel.fromMap(
        json.decode(response.body),
      );
      return pokemon;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<PokemonModel> getPokemonFromUrl(String url) async {
    try {
      final response = await http.get(url);
      PokemonModel pokemon = PokemonModel.fromMap(json.decode(response.body));
      return pokemon;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<PokemonModel>> getPokemonFromUrlList(
      List<PokemonListItemModel> pokemonListModel) async {
    List<PokemonModel> pokemonList = [];


    await Future.forEach(
      pokemonListModel,
      (PokemonListItemModel listItem) async {
        PokemonModel pokemon = await getPokemonFromUrl(listItem.url);
        pokemonList.add(pokemon);
      },
    );


    return pokemonList;
  }
}
