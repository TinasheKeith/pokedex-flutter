class PokemonModel {
  int id;
  String name;
  int order;
  Sprites sprites;
  int height;
  int weight;
  int baseExperience;
  List<Type> types;
  List<Stat> stats;
  Species species;

  PokemonModel({
    this.id,
    this.name,
    this.order,
    this.sprites,
    this.height,
    this.weight,
    this.types,
    this.species,
    this.baseExperience,
    this.stats,
  });

  factory PokemonModel.fromMap(Map data) {
    List pokemonTypes = data["types"];
    List stats = data["stats"];

    pokemonTypes = pokemonTypes.map((type) => Type.fromMap(type)).toList();
    stats = stats.map((stat) => Stat.fromMap(stat)).toList();

    return PokemonModel(
      id: data["id"],
      name: data["name"],
      order: data["order"],
      height: data["height"],
      weight: data["weight"],
      baseExperience: data["base_experience"],
      sprites: Sprites.fromMap(
        data["sprites"],
      ),
      species: Species.fromMap(
        data["species"],
      ),
      types: pokemonTypes,
      stats: stats,
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

class Species {
  String name;
  String url;

  Species({this.url, this.name});

  factory Species.fromMap(Map data) {
    return Species(
      url: data["url"],
      name: data["name"],
    );
  }
}

class SpeciesInfo {
  String name;
  int order;
  int genderRate;
  int captureRate;
  int baseHapiness;
  bool isBaby;
  int hatchCounter;
  FlavorTextEntry flavorTextEntry;

  SpeciesInfo({
    this.name,
    this.order,
    this.baseHapiness,
    this.captureRate,
    this.genderRate,
    this.hatchCounter,
    this.isBaby,
    this.flavorTextEntry,
  });

  factory SpeciesInfo.fromMap(Map data) {
    return SpeciesInfo(
      name: data["name"],
      order: data["order"],
      baseHapiness: data["base_hapiness"],
      captureRate: data["capture_rate"],
      isBaby: data["is_baby"],
      hatchCounter: data["hatchCounter"],
      flavorTextEntry: FlavorTextEntry.fromMap(
        data["flavor_text_entries"][1],
      ),
    );
  }
}

class Stat {
  int effort;
  int baseStat;
  String name;
  String url;

  Stat({
    this.effort,
    this.baseStat,
    this.name,
    this.url,
  });

  factory Stat.fromMap(Map data) {
    return Stat(
      effort: data["effort"],
      baseStat: data["base_stat"],
      name: data["stat"]["name"],
      url: data["stat"]["url"],
    );
  }
}

class FlavorTextEntry {
  String flavorText;
  String version;

  FlavorTextEntry({this.flavorText, this.version});

  factory FlavorTextEntry.fromMap(Map data) {
    return FlavorTextEntry(
      flavorText: data["flavor_text"],
      version: data["version"]["name"],
    );
  }
}
