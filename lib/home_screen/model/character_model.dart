class CharacterModel{
  String image;
  String name;
  String description;
  List<Movie> movies;
  List<Comic> readingMaterials;

  CharacterModel({
    this.name,
    this.image,
    this.description,
    this.movies,
    this.readingMaterials
  });
}


class Comic{
  String name;
  String image;

  Comic({
    this.name,
    this.image
  });
}

class Movie{
  String name;
  String image;

  Movie({
    this.name,
    this.image
  });
}