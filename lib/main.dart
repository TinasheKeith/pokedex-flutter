import 'package:flutter/material.dart';
import 'package:pokedex_app/notifiers/theme_mode_notifier.dart';
import 'package:pokedex_app/themes.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokedex_app/models/pokemon_list_model.dart';
import 'package:pokedex_app/services/pokedex_service.dart';

import 'package:pokedex_app/views/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      FutureProvider<PokemonListModel>.value(
        value: PokedexService().getPokemon(),
      ),
      ChangeNotifierProvider<AppThemeMode>.value(value: AppThemeMode()),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  final AppTheme _appTheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    final AppThemeMode appThemeMode = Provider.of<AppThemeMode>(context);

    return MaterialApp(
      title: 'pokedex',
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: appThemeMode.isDarkMode ? _appTheme.darkTheme() : _appTheme.lightTheme(),
    );
  }
}
