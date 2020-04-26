import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:provider/provider.dart';
import 'pokemon_cards.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<PokemonModel> pokemonModels =
        Provider.of<List<PokemonModel>>(context);

    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = 200;

      if (maxScroll - currentScroll <= delta) {
        
      }
    });

    if (pokemonModels != null)
      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: pokemonModels.length,
          itemBuilder: (BuildContext context, int i) {
            return PokemonCard(
              pokemon: pokemonModels[i],
            );
          },
        ),
      );

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
