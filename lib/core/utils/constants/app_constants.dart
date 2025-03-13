import '../../../data/models/categories/animal.dart';
import '../../../data/models/categories/country.dart';
import '../../../data/models/categories/county.dart';
import '../../../data/models/categories/planet.dart';
import '../../../data/models/categories/president.dart';
import '../../../data/models/categories/vehicle.dart';
import '../../../data/models/puzzle.dart';
import '../../../presentation/themes/animal_theme.dart';
import '../../../presentation/themes/country_theme.dart';
import '../../../presentation/themes/county_theme.dart';
import '../../../presentation/themes/planet_theme.dart';
import '../../../presentation/themes/president_theme.dart';
import '../../../presentation/themes/puzzle_theme.dart';
import '../../../presentation/themes/vehicle_theme.dart';

class AppConstants {
  AppConstants._();

  static const appTitle = 'Tupange';

  static const kFontFamily = 'ComicSans';

  static const Map<PuzzleLevel, int> kPuzzleLevel = {
    PuzzleLevel.easy: 3,
    PuzzleLevel.medium: 4,
    PuzzleLevel.hard: 5,
  };

  static const Map<PuzzleCategory, int> kPuzzleCategory = {
    PuzzleCategory.planets: 1,
  };

  static const List<Animal> animals = [
    Animal(key: 1, type: AnimalType.animal1),
    Animal(key: 2, type: AnimalType.animal2),
    Animal(key: 3, type: AnimalType.animal3),
    Animal(key: 4, type: AnimalType.animal4),
    Animal(key: 5, type: AnimalType.animal5),
    Animal(key: 6, type: AnimalType.animal6),
    Animal(key: 7, type: AnimalType.animal7),
    Animal(key: 8, type: AnimalType.animal8),
    Animal(key: 9, type: AnimalType.animal9),
    Animal(key: 10, type: AnimalType.animal10),
    Animal(key: 11, type: AnimalType.animal11),
    Animal(key: 12, type: AnimalType.animal12),
  ];

  static const List<Planet> planets = [
    Planet(key: 1, type: PlanetType.planet1),
    Planet(key: 2, type: PlanetType.planet2),
    Planet(key: 3, type: PlanetType.planet3),
    Planet(key: 4, type: PlanetType.planet4),
    Planet(key: 5, type: PlanetType.planet5),
    Planet(key: 6, type: PlanetType.planet6),
    Planet(key: 7, type: PlanetType.planet7),
    Planet(key: 8, type: PlanetType.planet8),
    Planet(key: 9, type: PlanetType.planet9),
  ];

  static const List<County> counties = [
    County(key: 1, type: CountyType.county1),
    County(key: 2, type: CountyType.county2),
    County(key: 3, type: CountyType.county3),
    County(key: 4, type: CountyType.county4),
    County(key: 5, type: CountyType.county5),
    County(key: 6, type: CountyType.county6),
    County(key: 7, type: CountyType.county7),
    County(key: 8, type: CountyType.county8),
    County(key: 9, type: CountyType.county9),
    County(key: 10, type: CountyType.county10),
    County(key: 11, type: CountyType.county11),
    County(key: 12, type: CountyType.county12),
    County(key: 13, type: CountyType.county13),
    County(key: 14, type: CountyType.county14),
    County(key: 15, type: CountyType.county15),
    County(key: 16, type: CountyType.county16),
    County(key: 17, type: CountyType.county17),
    County(key: 18, type: CountyType.county18),
    County(key: 19, type: CountyType.county19),
  ];

  static const List<Country> countries = [
    Country(key: 1, type: CountryType.country1),
    Country(key: 2, type: CountryType.country2),
    Country(key: 3, type: CountryType.country3),
    Country(key: 4, type: CountryType.country4),
    Country(key: 5, type: CountryType.country5),
    Country(key: 6, type: CountryType.country6),
    Country(key: 7, type: CountryType.country7),
    Country(key: 8, type: CountryType.country8),
    Country(key: 9, type: CountryType.country9),
    Country(key: 10, type: CountryType.country10),
    Country(key: 11, type: CountryType.country11),
    Country(key: 12, type: CountryType.country12),
    Country(key: 13, type: CountryType.country13),
  ];

  static const List<President> presidents = [
    President(key: 1, type: PresidentType.president1),
    President(key: 2, type: PresidentType.president2),
    President(key: 3, type: PresidentType.president3),
    President(key: 4, type: PresidentType.president4),
    President(key: 5, type: PresidentType.president5),
    President(key: 6, type: PresidentType.president6),
    President(key: 7, type: PresidentType.president7),
    President(key: 8, type: PresidentType.president8),
    President(key: 9, type: PresidentType.president9),
    President(key: 10, type: PresidentType.president10),
    President(key: 11, type: PresidentType.president11),
    President(key: 12, type: PresidentType.president12),
    President(key: 13, type: PresidentType.president13),
    President(key: 14, type: PresidentType.president14),
  ];

  static const List<Vehicle> vehicles = [
    Vehicle(key: 1, type: VehicleType.vehicle1),
    Vehicle(key: 2, type: VehicleType.vehicle2),
    Vehicle(key: 3, type: VehicleType.vehicle3),
    Vehicle(key: 4, type: VehicleType.vehicle4),
    Vehicle(key: 5, type: VehicleType.vehicle5),
    Vehicle(key: 6, type: VehicleType.vehicle6),
    Vehicle(key: 7, type: VehicleType.vehicle7),
  ];

  static const Map<CountyType, PuzzleTheme> countyThemeMap = {
    CountyType.county1: County1Theme(),
    CountyType.county2: County2Theme(),
    CountyType.county3: County3Theme(),
    CountyType.county4: County4Theme(),
    CountyType.county5: County5Theme(),
    CountyType.county6: County6Theme(),
    CountyType.county7: County7Theme(),
    CountyType.county8: County8Theme(),
    CountyType.county9: County9Theme(),
    CountyType.county10: County10Theme(),
    CountyType.county11: County11Theme(),
    CountyType.county12: County12Theme(),
    CountyType.county13: County13Theme(),
    CountyType.county14: County14Theme(),
    CountyType.county15: County15Theme(),
    CountyType.county16: County16Theme(),
    CountyType.county17: County17Theme(),
    CountyType.county18: County18Theme(),
    CountyType.county19: County19Theme(),
  };

  static const Map<AnimalType, PuzzleTheme> animalThemeMap = {
    AnimalType.animal1: Animal1Theme(),
    AnimalType.animal2: Animal2Theme(),
    AnimalType.animal3: Animal3Theme(),
    AnimalType.animal4: Animal4Theme(),
    AnimalType.animal5: Animal5Theme(),
    AnimalType.animal6: Animal6Theme(),
    AnimalType.animal7: Animal7Theme(),
    AnimalType.animal8: Animal8Theme(),
    AnimalType.animal9: Animal9Theme(),
    AnimalType.animal10: Animal10Theme(),
    AnimalType.animal11: Animal11Theme(),
    AnimalType.animal12: Animal12Theme(),
  };
  static const Map<CountryType, PuzzleTheme> countryThemeMap = {
    CountryType.country1: Country1Theme(),
    CountryType.country2: Country2Theme(),
    CountryType.country3: Country3Theme(),
    CountryType.country4: Country4Theme(),
    CountryType.country5: Country5Theme(),
    CountryType.country6: Country6Theme(),
    CountryType.country7: Country7Theme(),
    CountryType.country8: Country8Theme(),
    CountryType.country9: Country9Theme(),
    CountryType.country10: Country10Theme(),
    CountryType.country11: Country11Theme(),
    CountryType.country12: Country12Theme(),
    CountryType.country13: Country13Theme(),
  };

  static const Map<PlanetType, PuzzleTheme> planetThemeMap = {
    PlanetType.planet1: Planet1Theme(),
    PlanetType.planet2: Planet2Theme(),
    PlanetType.planet3: Planet3Theme(),
    PlanetType.planet4: Planet4Theme(),
    PlanetType.planet5: Planet5Theme(),
    PlanetType.planet6: Planet6Theme(),
    PlanetType.planet7: Planet7Theme(),
    PlanetType.planet8: Planet8Theme(),
    PlanetType.planet9: Planet9Theme(),
  };

  static const Map<PresidentType, PuzzleTheme> presidentThemeMap = {
    PresidentType.president1: President1Theme(),
    PresidentType.president2: President2Theme(),
    PresidentType.president3: President3Theme(),
    PresidentType.president4: President4Theme(),
    PresidentType.president5: President5Theme(),
    PresidentType.president6: President6Theme(),
    PresidentType.president7: President7Theme(),
    PresidentType.president8: President8Theme(),
    PresidentType.president9: President9Theme(),
    PresidentType.president10: President10Theme(),
    PresidentType.president11: President11Theme(),
    PresidentType.president12: President12Theme(),
    PresidentType.president13: President13Theme(),
    PresidentType.president14: President14Theme(),
  };

  static const Map<VehicleType, PuzzleTheme> vehicleThemeMap = {
    VehicleType.vehicle1: Vehicle1Theme(),
    VehicleType.vehicle2: Vehicle2Theme(),
    VehicleType.vehicle3: Vehicle3Theme(),
    VehicleType.vehicle4: Vehicle4Theme(),
    VehicleType.vehicle5: Vehicle5Theme(),
    VehicleType.vehicle6: Vehicle6Theme(),
    VehicleType.vehicle7: Vehicle7Theme(),
  };
}
