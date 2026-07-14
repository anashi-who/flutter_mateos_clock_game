import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home_page.dart';
import 'l10n/l10n.dart';
import 'score/score.dart';
import 'settings/settings.dart';
import 'storage/storage_shared_preferences.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => StorageSharedPreferences(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ScoreCubit(
              context.read<StorageSharedPreferences>(),
            ),
          ),
          BlocProvider(
            create: (context) => SettingsCubit(
              context.read<StorageSharedPreferences>(),
            ),
            lazy: false,
          ),
        ],
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.watch<SettingsCubit>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5E8C3A),
          primary: const Color(0xFF5E8C3A),
          secondary: const Color(0xFF8D6E63),
          surface: const Color(0xFFF7F2D8),
          onPrimary: Colors.white,
          onSurface: const Color(0xFF3E3A2D),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F2D8),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5E8C3A),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 4,
            shadowColor: Colors.black26,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5E8C3A),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: false,
      ),
      locale: Locale(settingsCubit.state.selectedLanguage ?? 'en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
