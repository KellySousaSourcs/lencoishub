import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/place_details_screen.dart';
import 'package:lencois_hub/widgets/category_item.dart';
import 'package:lencois_hub/widgets/custom_botton_nav.dart';
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
  final List<Map<String, String>> categories = [
    {'label': 'cat_inn', 'image': 'assets/images/categories/inn.jpg'},
    {'label': 'cat_bar', 'image': 'assets/images/categories/bar.jpg'},
    {'label': 'cat_square', 'image': 'assets/images/categories/square.jpg'},
    {
      'label': 'cat_itineraries',
      'image': 'assets/images/categories/itineraries.jpg',
    },
    {
      'label': 'cat_restaurant',
      'image': 'assets/images/categories/restaurant.jpg',
    },
    {
      'label': 'cat_beauty_salon',
      'image': 'assets/images/categories/beauty_salon.jpg',
    },
    {
      'label': 'cat_tour_agency',
      'image': 'assets/images/categories/tour_agency.jpg',
    },
    {
      'label': 'cat_handcraft',
      'image': 'assets/images/categories/handcraft.jpg',
    },
    {'label': 'cat_laundry', 'image': 'assets/images/categories/laundry.jpg'},
    {
      'label': 'cat_clothing_store',
      'image': 'assets/images/categories/clothing_store.jpg',
    },
  ];

  final List<Map<String, dynamic>> restaurantes = [
    {
      'name': 'Restaurante Jacaré',
      'mainImage': 'assets/images/images_de_fundo/fachadajacare.png',
      'imageCard': 'assets/images/photo_card/restaurante_jacare.png',
      'description': 'description_jacare',
      'photos': [
        'assets/images/images_de_fundo/espaguete_jacare.jpg',
        'assets/images/images_de_fundo/fachadajacare.png',
        'assets/images/images_de_fundo/jacare_fotos.jpg',
      ],
      'openStatusKey': 'open_all_day',
      'timeValue': 'time_24h',
    },
  ];

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
      bottomNavigationBar: const CustomBottonNav(),

      body: SafeArea(
        child: Column(
          children: [
            // 🔹 HEADER FIXO
            HomeHeader(),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  ...categories.map((category) {
                    return CategoryItem(
                      label: Translator.t(category['label']!),
                      imagePath: category['image']!,
                    );
                  }),
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailsScreen(
                                    name: 'Restaurante Jacaré',
                                    mainImage:
                                        'assets/images/images_de_fundo/fachadajacare.png',

                                    description: Translator.t(
                                      'description_jacare',
                                    ),
                                    photos: [
                                      'assets/images/images_de_fundo/espaguete_jacare.jpg',
                                      'assets/images/images_de_fundo/fachadajacare.png',
                                      'assets/images/images_de_fundo/jacare_fotos.jpg',
                                    ],
                                    openStatusKey: 'open_all_day',
                                    timeValue: 'time_24h',
                                    mapTitleKey: Translator.t('map_title'),
                                  ),
                                ),
                              );
                            },
                          ),
                          PlaceCard(
                            name: 'Restaurante O Bambu',
                            imagePath: 'assets/images/photo_card/bambu.jfif',
                            rating: '4.7',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PlaceDetailsScreen(
                                      name: 'Restaurante O Bambu',
                                      mainImage:
                                          'assets/images/photo_card/bambu.jfif',
                                      description: Translator.t(
                                        'description_bambu',
                                      ),
                                      photos: [
                                        'assets/images/images_de_fundo/ambiente_bambu.jfif',
                                        'assets/images/images_de_fundo/espaco_bambu.jfif',
                                        'assets/images/images_de_fundo/pizza_bambu.jfif',
                                      ],
                                      openStatusKey: 'open_all_day',
                                      timeValue: 'time_24h',
                                      mapTitleKey: Translator.t('map_title'),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          PlaceCard(
                            name: 'Restaurante Saborear',
                            imagePath:
                                'assets/images/photo_card/restaurante_saborear.avif',
                            rating: '4.3',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PlaceDetailsScreen(
                                      name: 'Restaurante Saborear',
                                      mainImage:
                                          'assets/images/photo_card/restaurante_saborear.avif',
                                      description: Translator.t(
                                        'description_saborear',
                                      ),
                                      photos: [
                                        'assets/images/images_de_fundo/ambiente_saborear.webp',
                                        'assets/images/images_de_fundo/salada_saborear.webp',
                                        'assets/images/images_de_fundo/torta_saborear.webp',
                                      ],
                                      openStatusKey: 'open_all_day',
                                      timeValue: 'time_24h',
                                      mapTitleKey: Translator.t('map_title'),
                                    );
                                  },
                                ),
                              );
                            },
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailsScreen(
                                    name: 'Vale dos Lençóis Turismo',
                                    mainImage:
                                        'assets/images/images_de_fundo/agencia/vale_lencois_interior.jfif',
                                    description: Translator.t(
                                      'description_vale',
                                    ),
                                    photos: [
                                      'assets/images/images_de_fundo/agencia/vale_lencois_interior.jfif',
                                      'assets/images/images_de_fundo/agencia/passeio_vale_lencois.jfif',
                                      'assets/images/images_de_fundo/agencia/paisagem_vale_lencois.jfif',
                                    ],
                                    openStatusKey: 'open_all_day',
                                    timeValue: 'time_24h',
                                    mapTitleKey: Translator.t('map_title'),
                                  ),
                                ),
                              );
                            },
                          ),
                          PlaceCard(
                            name: 'São Paulo Ecoturismo',
                            imagePath: 'assets/images/photo_card/saopaulo.jfif',
                            rating: '4.3',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailsScreen(
                                    name: 'São Paulo Ecoturismo',
                                    mainImage:
                                        'assets/images/photo_card/saopaulo.jfif',
                                    description: Translator.t(
                                      'description_vale',
                                    ),
                                    photos: [
                                      'assets/images/images_de_fundo/agencia/paisagem_vale_lencois.jfif',
                                      'assets/images/images_de_fundo/agencia/passeio_vale_lencois.jfif',
                                      'assets/images/images_de_fundo/agencia/paisagem_vale_lencois.jfif',
                                    ],
                                    openStatusKey: 'open_all_day',
                                    timeValue: 'time_24h',
                                    mapTitleKey: Translator.t('map_title'),
                                  ),
                                ),
                              );
                            },
                          ),
                          PlaceCard(
                            name: 'Agência Tigre Turismo',
                            imagePath:
                                'assets/images/photo_card/tigre_turismo.jfif',
                            rating: '4.7',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailsScreen(
                                    name: 'Agência Tigre Turismo',
                                    mainImage:
                                        'assets/images/photo_card/tigre_turismo.jfif',
                                    description: Translator.t(
                                      'description_vale',
                                    ),
                                    photos: [
                                      'assets/images/images_de_fundo/agencia/paisagem_vale_lencois.jfif',
                                      'assets/images/images_de_fundo/agencia/passeio_vale_lencois.jfif',
                                      'assets/images/images_de_fundo/agencia/paisagem_vale_lencois.jfif',
                                    ],
                                    openStatusKey: 'open_all_day',
                                    timeValue: 'time_24h',
                                    mapTitleKey: Translator.t('map_title'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    SectionHeader(
                      title: Translator.t('popular_inns'),
                      onTap: () {
                        print("Abrindo lista de todas as pousadas e hotéis...");
                      },
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 12, bottom: 6),
                      child: Row(
                        children: [
                          PlaceCard(
                            name: 'Pousada do Rancho',
                            imagePath:
                                'assets/images/photo_card/pousada_rancho.avif',
                            rating: '4.5',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailsScreen(
                                    name: 'Pousada do Rancho',
                                    mainImage:
                                        'assets/images/photo_card/pousada_rancho.avif',
                                    description: Translator.t(
                                      'description_rancho',
                                    ),
                                    photos: [
                                      'assets/images/images_de_fundo/pousada/rancho_quartos.avif',
                                      'assets/images/images_de_fundo/pousada/rancho_pousada.avif',
                                      'assets/images/images_de_fundo/pousada/rancho_paisagem.avif',
                                    ],
                                    openStatusKey: 'open_all_day',
                                    timeValue: 'time_24h',
                                    mapTitleKey: Translator.t('map_title'),
                                  ),
                                ),
                              );
                            },
                          ),
                          PlaceCard(
                            name: 'Barreirinhas Pousada',
                            imagePath:
                                'assets/images/photo_card/barreirinhas_pousada.png',
                            rating: '4.3',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailsScreen(
                                    name: 'Barreirinhas Pousada',
                                    mainImage:
                                        'assets/images/photo_card/barreirinhas_pousada.png',
                                    description: Translator.t(
                                      'description_barreirinhas',
                                    ),
                                    photos: [
                                      'assets/images/images_de_fundo/pousada/rancho_quartos.avif',
                                      'assets/images/images_de_fundo/pousada/rancho_pousada.avif',
                                      'assets/images/images_de_fundo/pousada/rancho_paisagem.avif',
                                    ],
                                    openStatusKey: 'open_all_day',
                                    timeValue: 'time_24h',
                                    mapTitleKey: Translator.t('map_title'),
                                  ),
                                ),
                              );
                            },
                          ),
                          PlaceCard(
                            name: 'Boa Vista Pousada',
                            imagePath:
                                'assets/images/photo_card/boa_vista.jfif',
                            rating: '4.7',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailsScreen(
                                    name: 'Pousada Boa Vista',
                                    mainImage:
                                        'assets/images/photo_card/boa_vista.jfif',
                                    description: Translator.t(
                                      'description_boa_vista',
                                    ),
                                    photos: [
                                      'assets/images/images_de_fundo/pousada/rancho_quartos.avif',
                                      'assets/images/images_de_fundo/pousada/rancho_pousada.avif',
                                      'assets/images/images_de_fundo/pousada/rancho_paisagem.avif',
                                    ],
                                    openStatusKey: 'open_all_day',
                                    timeValue: 'time_24h',
                                    mapTitleKey: Translator.t('map_title'),
                                  ),
                                ),
                              );
                            },
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
