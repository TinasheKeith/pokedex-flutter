import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex_app/shared/types_decoration.dart';
import 'package:pokedex_app/views/home/type_chip.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  final TypeDecoration _typeDecorations = TypeDecoration();

  PokemonCard({@required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _typeDecorations.getCardColor(pokemon.types[0].name),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "#${pokemon.order}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.0002),
                            Text(
                              pokemon.name.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.headline.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            SizedBox(height: screenHeight * 0.0002),
                            Wrap(
                              children: pokemon.types
                                  .map((type) => TypeChip(type))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            Positioned(
              top: screenHeight * -0.04,
              left: screenWidth - 150,
              child: CachedNetworkImage(
                imageUrl: pokemon.sprites.frontDefault,
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
