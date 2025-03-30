import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  //final supabaseUrl = dotenv.env['SUPABASE_URL'];
  //final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  //await supa.Supabase.initialize(url: supabaseUrl!, anonKey: supabaseAnonKey!);
  //AppUtils.logger('Supabase init started: $supabaseUrl');
  await configureDependencies(kIsWeb ? 'dev' : 'prod');
  runApp(const MyApp());
}
