import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:save_money/languages/languages.dart';
import 'package:save_money/view/main/learn.dart';
import 'package:save_money/view/main/main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class Routes {
  static const String mainDashboard = "/main/dashboard";
  static const String learnPage = "/main/learn";
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          AppLocale.EN,
          countryCode: 'US',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
          'fr',
          AppLocale.FR,
          countryCode: 'FR',
          fontFamily: 'Font FR',
        ),
        const MapLocale(
          'ar',
          AppLocale.AR,
          countryCode: 'SA',
          fontFamily: 'Font AR',
        ),
        const MapLocale(
          'bn',
          AppLocale.BN,
          countryCode: 'BD',
          fontFamily: 'Font BN',
        ),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Save Money",
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      theme: ThemeData(
        fontFamily: _localization.fontFamily,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (var platform in TargetPlatform.values)
              platform: CupertinoPageTransitionsBuilder(),
          },
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      initialRoute: Routes.learnPage,
      routes: {
        Routes.mainDashboard: (context) => MainDashboardView(),
        Routes.learnPage: (context) => LearnView(),
      },
    );
  }
}
