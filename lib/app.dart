import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/blocs/audio/audio_control_bloc.dart';
import 'presentation/cubits/audio/audio_player_cubit.dart';
import 'presentation/blocs/auth/auth_bloc.dart';
import 'core/l10n/l10n.dart';
import 'domain/repository/auth_repository.dart';
import 'core/utils/constants/app_constants.dart';
import 'presentation/cubits/loading/assetcache_cubit.dart';
import 'presentation/navigator/main_navigator.dart';
import 'presentation/widgets/keyboard_handlers/app_keyboard_handler.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final navigatorKey = MainNavigatorState.navigationKey;
  NavigatorState get navigator =>
      MainNavigatorState.navigationKey.currentState!;
  late final AuthRepository _authRepo;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    _authRepo = AuthRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepo,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepo: _authRepo),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final Widget? dashboard;
  const AppView({super.key, this.dashboard});

  @override
  State<AppView> createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  final navigatorKey = MainNavigatorState.navigationKey;
  NavigatorState get navigator =>
      MainNavigatorState.navigationKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AudioControlBloc()),
        BlocProvider(
          create: (context) => AudioPlayerCubit(
            context.read<AudioControlBloc>(),
          ),
        ),
        BlocProvider(create: (_) => AssetcacheCubit()),
      ],
      child: AppKeyboardHandler(
        child: MaterialApp(
          home: widget.dashboard,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(fontFamily: AppConstants.kFontFamily),
          supportedLocales: const [Locale('sw')],
          initialRoute: MainNavigatorState.initialRoute,
          onGenerateRoute: MainNavigatorState.onGenerateRoute,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
