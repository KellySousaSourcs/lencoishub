import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/home_screen.dart';
import 'package:lencois_hub/screens/language_screen.dart';
import 'package:lencois_hub/screens/login_screen.dart';
import 'package:lencois_hub/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LencoisHubApp());
}

class LencoisHubApp extends StatelessWidget {
  const LencoisHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/language': (_) => const LanguageScreen(),
        '/login': (_) => const LoginScreen(), // ✅ SEM parâmetro
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
