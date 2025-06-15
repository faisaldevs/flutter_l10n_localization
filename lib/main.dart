import 'package:flutter/material.dart';
import 'package:flutter_l10n_localization/about_page.dart';
import 'package:flutter_l10n_localization/home_screen.dart';
import 'package:flutter_l10n_localization/routes/app_route.dart';
import 'package:flutter_l10n_localization/setting_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/localization_provider.dart';
import 'core/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedLocaleCode = prefs.getString('locale');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocalizationProvider(savedLocaleCode)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocalizationProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Production App',
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      locale: localeProvider.locale,
      supportedLocales: const [Locale('en'), Locale('bn')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return supportedLocales.first;
        return supportedLocales.contains(locale) ? locale : supportedLocales.first;
      },
      initialRoute: RouteNames.home,
      routes: {
        RouteNames.home: (_) => const HomePage(),
        RouteNames.settings: (_) => const SettingsPage(),
        RouteNames.about: (_) => const AboutPage(),
      },
    );
  }
}
