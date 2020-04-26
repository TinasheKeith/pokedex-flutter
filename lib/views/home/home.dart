import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/services/pokedex_service.dart';
import 'package:pokedex_app/models/pokemon_list_model.dart';
import 'package:pokedex_app/shared/dark_mode_toggle/dark_mode_toggle.dart';
import 'pokemon_list_view.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PokemonListModel pokemonListModel =
        Provider.of<PokemonListModel>(context);

    print("[HOME] $pokemonListModel");

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Pokédex",
                    style: Theme.of(context).textTheme.display2,
                  ),
                  DarkModeToggle(),
                ],
              ),
              SizedBox(height: 12),
              Text(
                "Search for Pokémon by name or using the National Pokédex number.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: "What Pokémon are you looking for?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(style: BorderStyle.none, width: 0.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
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
