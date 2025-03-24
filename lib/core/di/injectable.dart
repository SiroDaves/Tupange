import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies(String environment) async {
  //logger('Using environment: $environment');
  await getIt.initGetIt(environment: environment);
  await getIt.allReady();
}

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<SharedPreferences> prefsRepository() =>
      SharedPreferences.getInstance();
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) {
  if (kIsWeb) {
    return jsonDecode(text);
  } else {
    return compute<String, dynamic>(_parseAndDecode, text);
  }
}
