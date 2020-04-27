import 'package:flutter/material.dart';
import 'package:pokedex_app/shared/dark_mode_toggle/dark_mode_toggle.dart';

class HomeScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
