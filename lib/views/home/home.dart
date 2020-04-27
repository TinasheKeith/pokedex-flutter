import 'package:flutter/material.dart';

import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/services/pokedex_service.dart';
import 'package:pokedex_app/models/pokemon_list_model.dart';
import 'package:pokedex_app/views/home/home_screen_header.dart';
import 'pokemon_list_view.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonListModel pokemonListModel =
        Provider.of<PokemonListModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HomeScreenHeader(),
              if (pokemonListModel != null)
                FutureProvider<List<PokemonModel>>.value(
                  value: PokedexService()
                      .getPokemonFromUrlList(pokemonListModel.pokemonList),
                  child: PokemonListView(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
