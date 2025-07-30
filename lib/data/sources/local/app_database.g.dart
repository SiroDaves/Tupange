// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CategoriesDao? _categoriesDaoInstance;

  GamesDao? _gamesDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `categories` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `rid` INTEGER, `title` TEXT, `description` TEXT, `image` TEXT, `createdAt` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `games` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `rid` INTEGER, `category` INTEGER, `title` TEXT, `description` TEXT, `image` TEXT, `facts` TEXT, `createdAt` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CategoriesDao get categoriesDao {
    return _categoriesDaoInstance ??= _$CategoriesDao(database, changeListener);
  }

  @override
  GamesDao get gamesDao {
    return _gamesDaoInstance ??= _$GamesDao(database, changeListener);
  }
}

class _$CategoriesDao extends CategoriesDao {
  _$CategoriesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _categoryInsertionAdapter = InsertionAdapter(
            database,
            'categories',
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'rid': item.rid,
                  'title': item.title,
                  'description': item.description,
                  'image': item.image,
                  'createdAt': item.createdAt
                }),
        _categoryDeletionAdapter = DeletionAdapter(
            database,
            'categories',
            ['id'],
            (Category item) => <String, Object?>{
                  'id': item.id,
                  'rid': item.rid,
                  'title': item.title,
                  'description': item.description,
                  'image': item.image,
                  'createdAt': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Category> _categoryInsertionAdapter;

  final DeletionAdapter<Category> _categoryDeletionAdapter;

  @override
  Future<Category?> findCategoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM categories WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as int?,
            rid: row['rid'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            image: row['image'] as String?,
            createdAt: row['createdAt'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Category>> fetchCategories() async {
    return _queryAdapter.queryList('SELECT * FROM categories',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as int?,
            rid: row['rid'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            image: row['image'] as String?,
            createdAt: row['createdAt'] as String?));
  }

  @override
  Future<void> deleteAllCategories() async {
    await _queryAdapter.queryNoReturn('DELETE FROM categories');
  }

  @override
  Future<void> insertCategory(Category category) async {
    await _categoryInsertionAdapter.insert(
        category, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCategory(Category category) async {
    await _categoryDeletionAdapter.delete(category);
  }
}

class _$GamesDao extends GamesDao {
  _$GamesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _gameInsertionAdapter = InsertionAdapter(
            database,
            'games',
            (Game item) => <String, Object?>{
                  'id': item.id,
                  'rid': item.rid,
                  'category': item.category,
                  'title': item.title,
                  'description': item.description,
                  'image': item.image,
                  'facts': item.facts,
                  'createdAt': item.createdAt
                }),
        _gameDeletionAdapter = DeletionAdapter(
            database,
            'games',
            ['id'],
            (Game item) => <String, Object?>{
                  'id': item.id,
                  'rid': item.rid,
                  'category': item.category,
                  'title': item.title,
                  'description': item.description,
                  'image': item.image,
                  'facts': item.facts,
                  'createdAt': item.createdAt
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Game> _gameInsertionAdapter;

  final DeletionAdapter<Game> _gameDeletionAdapter;

  @override
  Future<Game?> findGameById(int id) async {
    return _queryAdapter.query('SELECT * FROM games WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Game(
            rid: row['rid'] as int?,
            category: row['category'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            image: row['image'] as String?,
            facts: row['facts'] as String?,
            createdAt: row['createdAt'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<Game>> fetchGames() async {
    return _queryAdapter.queryList('SELECT * FROM games',
        mapper: (Map<String, Object?> row) => Game(
            rid: row['rid'] as int?,
            category: row['category'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            image: row['image'] as String?,
            facts: row['facts'] as String?,
            createdAt: row['createdAt'] as String?));
  }

  @override
  Future<void> deleteAllGames() async {
    await _queryAdapter.queryNoReturn('DELETE FROM games');
  }

  @override
  Future<void> insertGame(Game entry) async {
    await _gameInsertionAdapter.insert(entry, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteGame(Game entry) async {
    await _gameDeletionAdapter.delete(entry);
  }
}
