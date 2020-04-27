import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/services/pokedex_service.dart';

class AboutTab extends StatelessWidget {
  final PokemonModel pokemon;
  final Color color;

  AboutTab({this.pokemon, this.color});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PokedexService().getSpecies(pokemon.species.url),
      builder: (context, snapshot) {
        SpeciesInfo species = snapshot.data;

        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  species.flavorTextEntry.flavorText,
                  style: Theme.of(context).textTheme.body1,
                ),
                SizedBox(height: 20),
                Text(
                  "Pokedex Data",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(color: color ?? Colors.black),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Species"),
                        SizedBox(height: 15),
                        Text("Height"),
                        SizedBox(height: 15),
                        Text("Weight"),
                        SizedBox(height: 15),
                        Text("Abilities"),
                        SizedBox(height: 15),
                        Text("Weaknesses"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(species.name),
                        SizedBox(height: 15),
                        Text("${pokemon.height.toString()} m"),
                        SizedBox(height: 15),
                        Text("${pokemon.weight.toString()} kg"),
                        SizedBox(height: 15),
                        Text("0"),
                        SizedBox(height: 15),
                        Text("0"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
