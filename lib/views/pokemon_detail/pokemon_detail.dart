import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/shared/types_decoration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex_app/views/pokemon_detail/about_tab.dart';
import '../home/type_chip.dart';

class PokemonDetail extends StatefulWidget {
  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail>
    with SingleTickerProviderStateMixin {
  final TypeDecoration _typeDecoration = TypeDecoration();

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final PokemonModel pokemon =
        ModalRoute.of(context).settings.arguments as PokemonModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: _typeDecoration.getCardColor(
              pokemon.types[0].name,
            ),
            pinned: true,
            expandedHeight: 250,
            centerTitle: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                          tag: pokemon.name,
                          child: CachedNetworkImage(
                              imageUrl: pokemon.sprites.frontDefault),
                        ),
                        Column(
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
                            Text(
                              pokemon.name.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.headline.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                            Wrap(
                              children: pokemon.types
                                  .map(
                                    (type) => TypeChip(type),
                                  )
                                  .toList(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.white.withOpacity(0.4),
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Stats'),
                Tab(text: 'Evolution'),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(24))),
                  child: AboutTab(pokemon: pokemon, color: _typeDecoration.getChipColor(pokemon.types[0].name,),)
                ),
                Center(
                  child: Text("Stats"),
                ),
                Center(
                  child: Text("Evolution"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
