import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:save_money/languages/languages.dart';
import 'package:save_money/view/main/learn.dart';
import 'package:save_money/view/main/main.dart';
import 'package:save_money/view/main/settings.dart';
import 'package:save_money/view/main/transactions.dart';
import 'package:save_money/view/main/wallets.dart';

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
  static const String transactionsPage = "/main/transactions";
  static const String wallets = "/main/wallets";
  static const String settings = "/main/settings";
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
      initialRoute: Routes.settings,

      routes: {
        Routes.mainDashboard: (context) => MainDashboardView(),
        Routes.learnPage: (context) => LearnView(),
        Routes.transactionsPage: (context) => TransactionsView(),
        Routes.wallets : (context) => WalletsView(),
        Routes.settings: (context) => SettingsView(), 
      },
    );
  }
}
