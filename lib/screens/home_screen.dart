import 'package:flutter/material.dart';
import 'package:lencois_hub/widgets/category_item.dart';
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  CategoryItem(
                    label: Translator.t('cat_inn'),
                    imagePath: ('assets/images/categories/inn.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_bar'),
                    imagePath: ('assets/images/categories/bar.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_square'),
                    imagePath: ('assets/images/categories/square.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_beauty_salon'),
                    imagePath: ('assets/images/categories/beauty_salon.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_tour_agency'),
                    imagePath: ('assets/images/categories/tour_agency.jg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_itineraries'),
                    imagePath: ('assets/imags/categories/itineraries.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_restaurant'),
                    imagePath: ('assets/images/categories/restaurant.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_handcraft'),
                    imagePath: ('assets/images/categories/handcraft.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_laundry'),
                    imagePath: ('assets/images/categories/laundry.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_clothing_store'),
                    imagePath: ('assets/images/categories/clothing_store.jpg'),
                  ),
                  
                ],
              ),
            ),
            // 🔹 CONTEÚDO SCROLLÁVEL
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    // 🔹 PRÓXIMOS EVENTOS (depois a gente faz)
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
      backgroundColor: Color(0xff019879),
      selectedItemColor: Color(0xffFFFFFF),
      unselectedItemColor: Color(0xffFFFFFF).withValues(alpha: 0.7),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: Translator.t('home_title'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: Translator.t('events_title'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_bus),
          label: Translator.t('transfer_title'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: Translator.t('explore_title'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: Translator.t('profile_title'),
        ),
      ],
    );
  }
}
