import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/category.dart';
import '../../models/game.dart';
import 'dao/categories_dao.dart';
import 'dao/games_dao.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    Category,
    Game,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  CategoriesDao get categoriesDao;
  GamesDao get gamesDao;
}

Future<AppDatabase> buildInMemoryDatabase() {
  return $FloorAppDatabase
      .inMemoryDatabaseBuilder()
      .build();
}
