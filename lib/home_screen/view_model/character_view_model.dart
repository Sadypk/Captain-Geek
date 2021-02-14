import 'package:captain_geek/home_screen/model/character_model.dart';

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
    ),
    CharacterModel(
      name: 'Superman',
      image: 'assets/images/superman.jpg',
    ),
    CharacterModel(
      name: 'Wonder Woman',
      image: 'assets/images/wonder.jpg',
    ),
    CharacterModel(
      name: 'Flash',
      image: 'assets/images/flash.jpg',
    ),
    CharacterModel(
      name: 'Green Lantern',
      image: 'assets/images/lantern.jpeg',
    ),
  ];

  static List<CharacterModel> marvel = [
    CharacterModel(
      name: 'Ironman',
      image: 'assets/images/ironman.jpg',
    ),
    CharacterModel(
      name: 'Captain America',
      image: 'assets/images/cap.png',
    ),
    CharacterModel(
      name: 'Thor',
      image: 'assets/images/thor.jpg',
    ),
    CharacterModel(
      name: 'Black Widow',
      image: 'assets/images/widow.jpg',
    ),
    CharacterModel(
      name: 'Hawkeye',
      image: 'assets/images/hawkeye.jpg',
    ),
  ];

  static List<CharacterModel> manga = [
    CharacterModel(
      name: 'Naruto',
      image: 'assets/images/naruto.jpeg',
    ),
    CharacterModel(
      name: 'Dragon Ball Z',
      image: 'assets/images/dbz.jpg',
    ),
    CharacterModel(
      name: 'Bleach',
      image: 'assets/images/bleach.jpg',
    ),
    CharacterModel(
      name: 'One Piece',
      image: 'assets/images/op.jpg',
    ),
    CharacterModel(
      name: 'Attack on Titan',
      image: 'assets/images/aot.jpg',
    ),
  ];
}