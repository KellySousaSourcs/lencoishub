import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/language_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final savedLanguage = prefs.getString('language');

  runApp(LencoisHubApp(language: savedLanguage));
}

class LencoisHubApp extends StatelessWidget {
  final String? language;

  const LencoisHubApp({super.key, this.language});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lençóis Hub',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Vamos manter sua splash primeiro
      routes: {
        '/language': (context) => const LanguageScreen(),
        '/login': (context) => LoginScreen(language: language ?? ''),
      },
    );
  }
}
