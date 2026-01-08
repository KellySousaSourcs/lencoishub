import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lencois_hub/screens/language_screen.dart';
import 'package:lencois_hub/screens/login_screen.dart';
import 'package:lencois_hub/screens/home_screen.dart';
import 'package:lencois_hub/utils/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
    _decideNextScreen(); // ✅ agora o método EXISTE
  }

  Future<void> _decideNextScreen() async {
    final prefs = await SharedPreferences.getInstance();

    final language = prefs.getString('language');
    final logged = prefs.getBool('logged') ?? false;

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    if (language == null) {
      _goTo(const LanguageScreen());
    } else if (!logged) {
      _goTo(LoginScreen());
    } else {
      _goTo(const HomeScreen());
    }
  }

  void _goTo(Widget page) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_lencoishub.png', height: 300),
              const SizedBox(height: 16),
              const Text(
                'Lençóis Hub',
                style: TextStyle(
                  fontFamily: 'achiko',
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Seu guia turístico de Barreirinhas MA',
                style: TextStyle(
                  fontFamily: 'Montserrat-Medium',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
