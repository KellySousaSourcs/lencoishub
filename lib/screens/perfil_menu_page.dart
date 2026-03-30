import 'package:flutter/material.dart';

class PerfilMenuPage extends StatelessWidget {
  const PerfilMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo
          Positioned.fill(
            child: Image.asset(
              'assets/images/explorar/b1.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              'Perfil Menu Page',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'achiko',
              ),
            ),
          ),
        ],
      ),
    );
  }
}