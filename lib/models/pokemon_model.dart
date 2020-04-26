class PokemonModel {
  String name;
  int order;
  Sprites sprites;
  int height;
  int weight;
  List<Type> types;

  PokemonModel(
      {this.name,
      this.order,
      this.sprites,
      this.height,
      this.weight,
      this.types});

  factory PokemonModel.fromMap(Map data) {
    List pokemonTypes = data["types"];

    pokemonTypes = pokemonTypes.map((type) => Type.fromMap(type)).toList();

    return PokemonModel(
      name: data["name"],
      order: data["order"],
      height: data["height"],
      weight: data["weight"],
      sprites: Sprites.fromMap(data["sprites"]),
      types: pokemonTypes,
    );
  }
}

class Sprites {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Sprites.fromMap(Map data) {
    return Sprites(
      backDefault: data["back_default"],
      backFemale: data["back_female"],
      backShiny: data["back_shiny"],
      backShinyFemale: data["back_shiny_female"],
      frontDefault: data["front_default"],
      frontFemale: data["front_female"],
      frontShiny: data["front_shiny"],
      frontShinyFemale: data["front_shiny_female"],
    );
  }
}

class Type {
  final int slot;
  final String name;

  Type({this.slot, this.name});

  factory Type.fromMap(Map data) {
    return Type(
      slot: data["slot"],
      name: data["type"]["name"],
    );
  }
}
