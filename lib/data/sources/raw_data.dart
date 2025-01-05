import '../models/category.dart';
import '../models/game.dart';

abstract class RawData {
  static List<Category> categories = [
    Category(id: 1, title: 'Sayari', image: 'planets'),
    Category(id: 2, title: 'Nchi', image: 'countries'),
    Category(id: 3, title: 'Wanyama', image: 'animals'),
  ];

  static List<Game> games = [
    Game(category: 1, title: 'Zebaki', image: 'planets/planet1'),
    Game(category: 1, title: 'Zuhura', image: 'planets/planet2'),
    Game(category: 1, title: 'Dunia', image: 'planets/planet3'),
    Game(category: 1, title: 'Mirihi', image: 'planets/planet4'),
    Game(category: 1, title: 'Mshtarii', image: 'planets/planet5'),
    Game(category: 1, title: 'Zohali', image: 'planets/planet6'),
    Game(category: 1, title: 'Kausi', image: 'planets/planet7'),
    Game(category: 1, title: 'Saratani', image: 'planets/planet8'),
    Game(category: 1, title: 'Utaridi', image: 'planets/planet9'),

    Game(category: 2, title: 'Algeria', image: 'countries/country1'),
    Game(category: 2, title: 'Botswana', image: 'countries/country2'),
    Game(category: 2, title: 'Kongo', image: 'countries/country3'),
    Game(category: 2, title: 'Misri', image: 'countries/country4'),
    Game(category: 2, title: 'Kenya', image: 'countries/country5'),
    Game(category: 2, title: 'Moroko', image: 'countries/country6'),
    Game(category: 2, title: 'Namibia', image: 'countries/country7'),
    Game(category: 2, title: 'Naijeria', image: 'countries/country8'),
    Game(category: 2, title: 'Afrika Kusini', image: 'countries/country9'),
    Game(category: 2, title: 'Sudani Kusini', image: 'countries/country10'),
    Game(category: 2, title: 'Tanzania', image: 'countries/country11'),
    Game(category: 2, title: 'Tunisia', image: 'countries/country12'),
    Game(category: 2, title: 'Uganda', image: 'countries/country13'),

    Game(category: 3, title: 'Nyani', image: 'animals/animal1'),
    Game(category: 3, title: 'Mbogo', image: 'animals/animal2'),
    Game(category: 3, title: 'Ndovu', image: 'animals/animal3'),
    Game(category: 3, title: 'Twiga', image: 'animals/animal4'),
    Game(category: 3, title: 'KIboko', image: 'animals/animal5'),
    Game(category: 3, title: 'Fisi', image: 'animals/animal6'),
    Game(category: 3, title: 'Chui', image: 'animals/animal7'),
    Game(category: 3, title: 'Simba', image: 'animals/animal8'),
    Game(category: 3, title: 'Tumbili', image: 'animals/animal9'),
    Game(category: 3, title: 'Kifaru', image: 'animals/animal10'),
    Game(category: 3, title: 'Kobe', image: 'animals/animal11'),
    Game(category: 3, title: 'Punda-Milia', image: 'animals/animal12'),
  ];
}
