import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

import 'app.dart';
import 'core/di/injectable.dart';
import 'core/utils/app_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  await supa.Supabase.initialize(url: supabaseUrl!, anonKey: supabaseAnonKey!);
  AppUtils.logger('Supabase init started: $supabaseUrl');
  await configureDependencies('prod');
  runApp(const MyApp());
}
