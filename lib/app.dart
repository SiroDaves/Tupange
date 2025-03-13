import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'presentation/blocs/audio/audio_control_bloc.dart';
import 'presentation/cubits/audio/audio_player_cubit.dart';
import 'presentation/themes/theme_data.dart';
import 'core/utils/constants/app_constants.dart';
import 'presentation/screens/start_screen.dart';
import 'presentation/widgets/keyboard_handlers/app_keyboard_handler.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    super.initState();
  }

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
      ],
      child: AppKeyboardHandler(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: AppConstants.appTitle,
          theme:  AppThemeData.mainTheme(),
          home: const StartScreen(),
        ),
      ),
    );
  }
}
