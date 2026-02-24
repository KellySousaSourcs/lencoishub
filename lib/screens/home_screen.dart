import 'package:flutter/material.dart';
import 'package:lencois_hub/widgets/category_item.dart';
import 'package:lencois_hub/widgets/home_header.dart';
import 'package:lencois_hub/widgets/place_card.dart';
import 'package:lencois_hub/widgets/promo_carousel.dart';
import 'package:lencois_hub/widgets/section_header.dart';
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
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, right: 10),
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
                    imagePath: ('assets/images/categories/tour_agency.jpg'),
                  ),
                  CategoryItem(
                    label: Translator.t('cat_itineraries'),
                    imagePath: ('assets/images/categories/itineraries.jpg'),
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    const PromoCarousel(
                      images: [
                        'assets/images/promo_banner/promo1.jpg',
                        'assets/images/promo_banner/promo2.jpg',
                        'assets/images/promo_banner/promo3.png',
                      ],
                    ),
                    const SizedBox(height: 2),
                    SectionHeader(
                      title: Translator.t('popular_restaurants'),
                      onTap: () {
                        print("Abrindo lista de todos os restaurantes...");
                      },
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          PlaceCard(
                            name: 'Restaurante Jacaré',
                            imagePath:
                                'assets/images/photo_card/restaurante_jacare.png',
                            rating: '4.5',
                          ),
                          PlaceCard(
                            name: 'Restaurante +Gostoso',
                            imagePath:
                                'assets/images/photo_card/maisgostoso.png',
                            rating: '4.7',
                          ),
                          PlaceCard(
                            name: 'Restaurante Saborear',
                            imagePath:
                                'assets/images/photo_card/restaurante_saborear.avif',
                            rating: '4.3',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    SectionHeader(
                      title: Translator.t('popular_travel_agency'),
                      onTap: () {
                        print(
                          "Abrindo lista de todas as agências de turismo...",
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          PlaceCard(
                            name: 'Vale dos Lençóis Turismo',
                            imagePath:
                                'assets/images/photo_card/vale_lencois.png',
                            rating: '4.5',
                          ),
                          PlaceCard(
                            name: 'São Paulo Ecoturismo',
                            imagePath: 'assets/images/photo_card/saopaulo.jfif',
                            rating: '4.3',
                          ),
                          PlaceCard(
                            name: 'Tigre Turismo',
                            imagePath:
                                'assets/images/photo_card/tigre_turismo.jfif',
                            rating: '4.7',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    SectionHeader(
                      title: Translator.t('popular_inns'),
                      onTap: () {
                        print(
                          "Abrindo lista de todas as pousadas e hotéis...",
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          PlaceCard(
                            name: 'Pousada do Rancho',
                            imagePath:
                                'assets/images/photo_card/pousada_rancho.avif',
                            rating: '4.5',
                          ),
                          PlaceCard(
                            name: 'Barreirinhas Pousada',
                            imagePath: 'assets/images/photo_card/barreirinhas_pousada.png',
                            rating: '4.3',
                          ),
                          PlaceCard(
                            name: 'Pousada Boa Vista',
                            imagePath:
                                'assets/images/photo_card/boa_vista.jfif',
                            rating: '4.7',
                          ),
                        ],
                      ),
                    ),
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
