import '../models/category.dart';
import '../models/game.dart';

abstract class RawData {
  static  String images = 'assets/images/';
  
  static List<Category> categories = [
    Category(id: 1, title: 'Sayari',image: '${images}planets.jpg'),
    Category(id: 2, title: 'Nchi',image: '${images}countries.jpg'),
    Category(id: 3, title: 'Wanyama',image: '${images}animals.jpg'),
  ];

  static List<Game> games = [
    Game(category: 1, title: 'Zebaki',image: '${images}planets/planet1.png'),
    Game(category: 1, title: 'Zuhura',image: '${images}planets/planet2.png'),
    Game(category: 1, title: 'Dunia',image: '${images}planets/planet3.png'),
    Game(category: 1, title: 'Mirihi',image: '${images}planets/planet4.png'),
    Game(category: 1, title: 'Mshtarii',image: '${images}planets/planet5.png'),
    Game(category: 1, title: 'Zohali',image: '${images}planets/planet6.png'),
    Game(category: 1, title: 'Kausi',image: '${images}planets/planet7.png'),
    Game(category: 1, title: 'Saratani',image: '${images}planets/planet8.png'),
    Game(category: 1, title: 'Utaridi',image: '${images}planets/planet9.png'),

    Game(category: 2, title: 'Algeria',image: '${images}countries/country1.jpg'),
    Game(category: 2, title: 'Botswana',image: '${images}countries/country2.jpg'),
    Game(category: 2, title: 'Kongo',image: '${images}countries/country3.jpg'),
    Game(category: 2, title: 'Misri',image: '${images}countries/country4.jpg'),
    Game(category: 2, title: 'Kenya',image: '${images}countries/country5.jpg'),
    Game(category: 2, title: 'Moroko',image: '${images}countries/country6.jpg'),
    Game(category: 2, title: 'Namibia',image: '${images}countries/country7.jpg'),
    Game(category: 2, title: 'Naijeria',image: '${images}countries/country8.jpg'),
    Game(category: 2, title: 'Afrika Kusini',image: '${images}countries/country9.jpg'),
    Game(category: 2, title: 'Sudani Kusini',image: '${images}countries/country10.jpg'),
    Game(category: 2, title: 'Tanzania',image: '${images}countries/country11.jpg'),
    Game(category: 2, title: 'Tunisia',image: '${images}countries/country12.jpg'),
    Game(category: 2, title: 'Uganda',image: '${images}countries/country13.jpg'),

    Game(category: 3, title: 'Nyani',image: '${images}animals/animal1.jpg'),
    Game(category: 3, title: 'Mbogo',image: '${images}animals/animal2.jpg'),
    Game(category: 3, title: 'Ndovu',image: '${images}animals/animal3.png'),
    Game(category: 3, title: 'Twiga',image: '${images}animals/animal4.jpg'),
    Game(category: 3, title: 'KIboko',image: '${images}animals/animal5.jpg'),
    Game(category: 3, title: 'Fisi',image: '${images}animals/animal6.jpg'),
    Game(category: 3, title: 'Chui',image: '${images}animals/animal7.jpg'),
    Game(category: 3, title: 'Simba',image: '${images}animals/animal8.jpg'),
    Game(category: 3, title: 'Tumbili',image: '${images}animals/animal9.jpg'),
    Game(category: 3, title: 'Kifaru',image: '${images}animals/animal10.png'),
    Game(category: 3, title: 'Kobe',image: '${images}animals/animal11.jpg'),
    Game(category: 3, title: 'Punda-Milia',image: '${images}animals/animal12.jpg'),
  ];
}
