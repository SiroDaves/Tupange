import '../datasources/local/app_database.dart';
import '../models/category.dart';
import '../models/game.dart';
import 'database_repository.dart';

/// Implementor of Database Repository
class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDB;

  DatabaseRepositoryImpl(this._appDB);

  @override
  Future<List<Game>> fetchGames() async {
    return _appDB.gamesDao.fetchGames();
  }

  @override
  Future<void> saveGame({required Game game}) async {
    return _appDB.gamesDao.insertGame(game);
  }

  @override
  Future<void> removeGame({required Game game}) async {
    return _appDB.gamesDao.deleteGame(game);
  }

  @override
  Future<void> removeAllGames() async {
    return _appDB.gamesDao.deleteAllGames();
  }

  @override
  Future<List<Category>> fetchCategories() async {
    return _appDB.categoriesDao.fetchCategories();
  }

  @override
  Future<void> saveCategory({required Category category}) async {
    return _appDB.categoriesDao.insertCategory(category);
  }

  @override
  Future<void> removeCategory({required Category category}) async {
    return _appDB.categoriesDao.deleteCategory(category);
  }

  @override
  Future<void> removeAllCategories() async {
    return _appDB.categoriesDao.deleteAllCategories();
  }
}
