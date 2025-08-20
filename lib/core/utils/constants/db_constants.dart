import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../app_utils.dart';
import 'app_constants.dart';

class DbConstants {
  DbConstants._();
  static const String categoriesTable = 'categories';
  static const String gamesTable = 'games';

  static Future<String> get databaseFile async {
    Directory dbFolder = await getApplicationDocumentsDirectory();
    if (isDesktop) {
      dbFolder = await getApplicationSupportDirectory();
    }

    var dbPath = join(dbFolder.path, '${AppConstants.appTitle}.db');
    AppUtils.logger('Opening database from: $dbPath');
    return dbPath;
  }
}
