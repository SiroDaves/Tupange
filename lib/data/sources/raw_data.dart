import '../models/category.dart';
import '../models/game.dart';

abstract class RawData {
  static List<Category> categories = [
    Category(id: 1, title: 'Sayari', isAsset: true, image: 'planets'),
    Category(id: 2, title: 'Nchi', isAsset: true, image: 'countries'),
    Category(id: 3, title: 'Wanyama', isAsset: true, image: 'animals'),
  ];

  static List<Game> games = [
    Game(category: 1, title: 'Zebaki', isAsset: true, image: 'planet1'),
    Game(category: 1, title: 'Zuhura', isAsset: true, image: 'planet2'),
    Game(category: 1, title: 'Dunia', isAsset: true, image: 'planet3'),
    Game(category: 1, title: 'Mirihi', isAsset: true, image: 'planet4'),
    Game(category: 1, title: 'Mshtarii', isAsset: true, image: 'planet5'),
    Game(category: 1, title: 'Zohali', isAsset: true, image: 'planet6'),
    Game(category: 1, title: 'Kausi', isAsset: true, image: 'planet7'),
    Game(category: 1, title: 'Saratani', isAsset: true, image: 'planet8'),
    Game(category: 1, title: 'Utaridi', isAsset: true, image: 'planet9'),

    Game(category: 2, title: 'Algeria', isAsset: true, image: 'country1'),
    Game(category: 2, title: 'Botswana', isAsset: true, image: 'country2'),
    Game(category: 2, title: 'Kongo', isAsset: true, image: 'country3'),
    Game(category: 2, title: 'Misri', isAsset: true, image: 'country4'),
    Game(category: 2, title: 'Kenya', isAsset: true, image: 'country5'),
    Game(category: 2, title: 'Moroko', isAsset: true, image: 'country6'),
    Game(category: 2, title: 'Namibia', isAsset: true, image: 'country7'),
    Game(category: 2, title: 'Naijeria', isAsset: true, image: 'country8'),
    Game(category: 2, title: 'Afrika Kusini', isAsset: true, image: 'country9'),
    Game(category: 2, title: 'Sudani Kusini', isAsset: true, image: 'country10'),
    Game(category: 2, title: 'Tanzania', isAsset: true, image: 'country11'),
    Game(category: 2, title: 'Tunisia', isAsset: true, image: 'country12'),
    Game(category: 2, title: 'Uganda', isAsset: true, image: 'country13'),

    Game(category: 3, title: 'Nyani', isAsset: true, image: 'animal1'),
    Game(category: 3, title: 'Mbogo', isAsset: true, image: 'animal2'),
    Game(category: 3, title: 'Ndovu', isAsset: true, image: 'animal3'),
    Game(category: 3, title: 'Twiga', isAsset: true, image: 'animal4'),
    Game(category: 3, title: 'KIboko', isAsset: true, image: 'animal5'),
    Game(category: 3, title: 'Fisi', isAsset: true, image: 'animal6'),
    Game(category: 3, title: 'Chui', isAsset: true, image: 'animal7'),
    Game(category: 3, title: 'Simba', isAsset: true, image: 'animal8'),
    Game(category: 3, title: 'Tumbili', isAsset: true, image: 'animal9'),
    Game(category: 3, title: 'Kifaru', isAsset: true, image: 'animal10'),
    Game(category: 3, title: 'Kobe', isAsset: true, image: 'animal11'),
    Game(category: 3, title: 'Punda-Milia', isAsset: true, image: 'animal12'),
  ];
}
