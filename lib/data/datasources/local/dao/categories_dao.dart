import 'package:floor/floor.dart';

import '../../../../core/utils/constants/db_constants.dart';
import '../../../models/category.dart';

@dao
abstract class CategoriesDao {
  @Query('SELECT * FROM ${DbConstants.categoriesTable} WHERE id = :id')
  Future<Category?> findCategoryById(int id);

  @Query('SELECT * FROM ${DbConstants.categoriesTable}')
  Future<List<Category>> fetchCategories();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCategory(Category category);

  @delete
  Future<void> deleteCategory(Category category);

  @Query("DELETE FROM ${DbConstants.categoriesTable}")
  Future<void> deleteAllCategories();
}
