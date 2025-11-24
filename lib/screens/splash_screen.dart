import 'package:flutter/material.dart';
import 'dart:async';
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

    // 1️⃣ Controla o tempo e o tipo de animação
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // 2️⃣ Define o tipo de transição (fade-in suave)
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward(); // inicia a animação

    // 3️⃣ Depois de 3 segundos, muda pra próxima tela
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/language');
    });
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
              Transform.translate(
                offset: const Offset(0, 1),
                child: Image.asset(
                  'assets/images/logo_lencoishub.png',
                  height: 350,
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -55),
                child: const Text(
                  'Lençóis Hub',
                  style: TextStyle(
                    fontFamily: 'achiko',
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -58),
                child: const Text(
                  'Seu guia turístico de Barreirinhas MA',
                  style: TextStyle(
                    fontFamily: 'Montserrat-Medium',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
