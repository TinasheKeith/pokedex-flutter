import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokedex_app/models/pokemon_list_model.dart';
import 'package:pokedex_app/services/pokedex_service.dart';

import 'package:pokedex_app/views/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    FutureProvider<PokemonListModel>.value(
      value: PokedexService().getPokemon(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFFEA5D60);
    final Color canvasColor = Colors.white;
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'pokedex',
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: GoogleFonts.notoSansTextTheme(textTheme).copyWith(
          display2: GoogleFonts.notoSans(
            textStyle: TextStyle(color: Colors.black),
            fontSize: 30
          ),
        ),
        primaryColor: primaryColor,
        canvasColor: canvasColor,
      ),
    );
  }
}
