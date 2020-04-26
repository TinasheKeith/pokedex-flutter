import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/shared/types_decoration.dart';

class TypeChip extends StatelessWidget {
  final Type _type;
  final TypeDecoration _typeDecoration = TypeDecoration();

  TypeChip(this._type);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        label: Text(
          _type.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _typeDecoration.getChipColor(_type.name),
      ),
    );
  }
}
