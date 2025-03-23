import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app/bloc/audio_control_bloc.dart';
import 'core/app/cubit/audio_player_cubit.dart';
import 'core/l10n/l10n.dart';
import 'core/utils/constants.dart';
import 'core/utils/quick_visit_counter.dart';
import 'presentation/cubits/loading/assetcache_cubit.dart';
import 'presentation/screens/loading/loading_page.dart';
import 'presentation/widgets/keyboard_handlers/app_keyboard_handler.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    QuickVisitCounter.countWebPageOpened();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AudioControlBloc()),
        BlocProvider(
          create: (context) =>
              AudioPlayerCubit(context.read<AudioControlBloc>()),
        ),
        BlocProvider(create: (_) => AssetcacheCubit()),
      ],
      child: AppKeyboardHandler(
        child: MaterialApp(
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          title: 'Planets',
          theme: ThemeData(fontFamily: kFontFamily),
          home: const LoadingPage(),
        ),
      ),
    );
  }
}
