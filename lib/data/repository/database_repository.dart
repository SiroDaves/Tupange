import '../models/category.dart';
import '../models/game.dart';

abstract class DatabaseRepository {
  Future<List<Game>> fetchGames();

  Future<void> saveGame({required Game game});

  Future<void> removeGame({required Game game});

  Future<void> removeAllGames();

  Future<List<Category>> fetchCategories();

  Future<void> saveCategory({required Category category});
  
  Future<void> removeCategory({required Category category});

  Future<void> removeAllCategories();
}
