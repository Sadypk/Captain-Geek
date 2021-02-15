import 'package:captain_geek/home_screen/model/character_model.dart';

import '../model/character_model.dart';

class CharacterViewModel{
  static List<String> header = [
    'assets/images/bvs.jpg',
    'assets/images/ivc.jpg',
    'assets/images/opmgif.gif'
  ];

  static List<CharacterModel> dc = [
    CharacterModel(
      name: 'Batman',
      image: 'assets/images/batman.jpg',
      movies: [
        Movie(
            name: 'Batman: The Dark Knight Returns Part 1',
            image: 'assets/images/bat4.jpg'
        ),
        Movie(
            name: 'Batman: The Dark Knight Returns Part 2',
            image: 'assets/images/bat5.jpg'
        ),
        Movie(
          name: 'Batman: Year One',
          image: 'assets/images/bat1.jpg'
        ),
        Movie(
            name: 'Batman: Mask Of The Phantasm',
            image: 'assets/images/bat2.jpg'
        ),
        Movie(
            name: 'Batman: Under The Red Hood',
            image: 'assets/images/bat3.jpg'
        ),
      ],
      readingMaterials: [
        Comic(
            name: 'DC: The Next Batman Part 1',
            image: 'assets/images/batComic1.jpg'
        ),
        Comic(
            name: 'DC: The Next Batman Part 2',
            image: 'assets/images/batComic2.jpg'
        ),
        Comic(
            name: 'Batman: The Three Joker',
            image: 'assets/images/batComic3.jpg'
        ),
        Comic(
            name: 'Batman - Catwoman',
            image: 'assets/images/batComic4.jpg'
        ),
      ]
    ),
    CharacterModel(
      name: 'Superman',
      image: 'assets/images/superman.jpg',
      readingMaterials: [],
      movies: []
    ),
    CharacterModel(
      name: 'Wonder Woman',
      image: 'assets/images/wonder.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Flash',
      image: 'assets/images/flash.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Green Lantern',
      image: 'assets/images/lantern.jpeg',
        readingMaterials: [],
        movies: []
    ),
  ];

  static List<CharacterModel> marvel = [
    CharacterModel(
      name: 'Ironman',
      image: 'assets/images/ironman.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Captain America',
      image: 'assets/images/cap.png',
    ),
    CharacterModel(
      name: 'Thor',
      image: 'assets/images/thor.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Black Widow',
      image: 'assets/images/widow.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Hawkeye',
      image: 'assets/images/hawkeye.jpg',
        readingMaterials: [],
        movies: []
    ),
  ];

  static List<CharacterModel> manga = [
    CharacterModel(
      name: 'Naruto',
      image: 'assets/images/naruto.jpeg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Dragon Ball Z',
      image: 'assets/images/dbz.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Bleach',
      image: 'assets/images/bleach.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'One Piece',
      image: 'assets/images/op.jpg',
        readingMaterials: [],
        movies: []
    ),
    CharacterModel(
      name: 'Attack on Titan',
      image: 'assets/images/aot.jpg',
        readingMaterials: [],
        movies: []
    ),
  ];
}