import 'package:flutter/material.dart';
import 'package:lencois_hub/widgets/home_categories.dart';
import 'package:lencois_hub/widgets/home_header.dart';
import '../utils/translations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // 🔹 carrega idioma salvo
    Translator.loadLanguage().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 bottom nav fixa
      bottomNavigationBar: const _BottomNav(),

      body: SafeArea(
        child: Column(
          children: [
            // 🔹 HEADER FIXO
            const HomeHeader(),
            const SizedBox(height: 6),
            // 🔹 CONTEÚDO SCROLLÁVEL
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    // 🔹 CATEGORIAS (BOLINHAS)
                    HomeCategories(),

                    const SizedBox(height: 24),

                    // 🔹 RESTAURANTES POPULARES (depois a gente faz)
                    _PlaceholderBlock('Restaurantes Populares'),

                    const SizedBox(height: 24),

                    _PlaceholderBlock('Pousadas & Hotéis'),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderBlock extends StatelessWidget {
  final String title;
  const _PlaceholderBlock(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xffF5F3EB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: Text(title)),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Eventos'),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bus),
          label: 'Transfer',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explorar'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}
