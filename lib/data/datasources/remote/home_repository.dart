import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/constants/db_constants.dart';
import '../../models/category.dart';
import '../../models/game.dart';

class HomeRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Category>> fetchCategories() async {
    AppUtils.logger('Now fetching categories');
    try {
      final resp = await _supabase.from(DbConstants.categoriesTable).select();
      AppUtils.logger('Response: $resp');
      if (resp.isNotEmpty) {
        final categories =
            (resp as List).map((item) => Category.fromJson(item)).toList();
        AppUtils.logger('${categories.length} categories fetched');
        return categories;
      }
    } catch (e) {
      AppUtils.logger('Unable to fetch categories: $e');
    }
    return [];
  }

  Future<List<Game>> fetchGames() async {
    AppUtils.logger('Now fetching games');
    try {
      final resp = await _supabase.from(DbConstants.gamesTable).select();
      AppUtils.logger('Response: $resp');
      if (resp.isNotEmpty) {
        final games =
            (resp as List).map((item) => Game.fromJson(item)).toList();
        AppUtils.logger('${games.length} games fetched');
        return games;
      }
    } catch (e) {
      AppUtils.logger('Unable to fetch games: $e');
    }
    return [];
  }
}
