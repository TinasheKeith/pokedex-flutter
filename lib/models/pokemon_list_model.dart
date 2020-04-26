class PokemonListModel {
  int count;
  String next;
  String previous;
  List<PokemonListItemModel> pokemonList;

  PokemonListModel({this.pokemonList, this.count, this.next, this.previous});

  factory PokemonListModel.fromMap(Map data) {
    List listItems = data["results"];

    listItems = listItems.map((listItem) {
      return PokemonListItemModel.fromMap(listItem);
    }).toList();

    return PokemonListModel(
      count: data["count"],
      next: data["next"],
      previous: data["previous"],
      pokemonList: listItems,
    );
  }
}

class PokemonListItemModel {
  String name;
  String url;

  PokemonListItemModel({this.name, this.url});

  factory PokemonListItemModel.fromMap(Map data) {
    return PokemonListItemModel(
      name: data["name"],
      url: data["url"],
    );
  }
}
