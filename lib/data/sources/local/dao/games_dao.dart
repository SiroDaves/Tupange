import 'package:floor/floor.dart';

import '../../../../core/utils/constants/db_constants.dart';
import '../../../models/game.dart';

@dao
abstract class GamesDao {
  @Query('SELECT * FROM ${DbConstants.gamesTable} WHERE id = :id')
  Future<Game?> findGameById(int id);

  @Query('SELECT * FROM ${DbConstants.gamesTable}')
  Future<List<Game>> fetchGames();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGame(Game entry);

  @delete
  Future<void> deleteGame(Game entry);

  @Query("DELETE FROM ${DbConstants.gamesTable}")
  Future<void> deleteAllGames();
}
