import 'package:shared_preferences/shared_preferences.dart';

class Translator {
  static String currentLanguage = 'pt';

  static Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    currentLanguage = prefs.getString('language') ?? 'pt';
  }

  static String t(String key) {
    return AppTranslations.data[currentLanguage]?[key] ??
        AppTranslations.data['pt']?[key] ??
        key;
  }
}

class AppTranslations {
  static const Map<String, Map<String, String>> data = {
    'pt': {
      'home_title': 'Início',
      'profile_title': 'Perfil',
      'explore_title': 'Explorar',
      'transfer_title': 'Transfer',
      'events_title': 'Eventos',
      'search_hint': 'Pesquise seu destino',
      'popular_restaurants': 'Restaurantes Populares',
      'popular_inns': 'Pousadas Populares',
      'popular_travel_agency': 'Agências de Turismo Populares',
      'see_more': 'ver mais',
      'open_all_day': 'Aberto',
      'time_24h': '24 Horas',
      'cat_location': 'Localização',
      'description_label': 'Descrição',

      'cat_culture': 'Cultura',
      'cat_education': 'Educação',
      'cat_culture_sport': 'Cultura/Esporte',
      'cat_musical': 'Musical',
      'cat_health': 'Saúde',
      'cat_crafts': 'Artesanato',

      'description_barreirinhas':
          'Pousada localizada no coração da cidade de Lençóis, conhecida por sua hospitalidade e ambiente acolhedor.',
      'description_boa_vista':
          'Pousada localizada no coração da cidade de Lençóis, conhecida por sua hospitalidade e ambiente acolhedor.',
      'description_rancho':
          'Pousada localizada no coração da cidade de Lençóis, conhecida por sua hospitalidade e ambiente acolhedor.',
      'description_vale':
          'Agência de turismo localizada no coração da cidade de Lençóis, conhecida por seus passeios incríveis e atendimento de qualidade.',
      'description_saborear':
          'Restaurante localizado no coração da cidade de Lençóis, conhecido por sua comida típica e ambiente acolhedor.',
      'description_bambu':
          'Restaurante localizado no coração da cidade de Lençóis, conhecido por sua comida típica e ambiente acolhedor.',
      'description_jacare':
          'Restaurante localizado no coração da cidade de Lençóis, conhecido por sua comida típica e ambiente acolhedor.',
      'map_title': 'Localização',
      'text_directions': 'Abrir no Googles Maps para ver a rota',

      'cat_laundry': 'Lavanderia',
      'cat_handcraft': 'Artesanato',
      'cat_sweet': 'Doceria',
      'cat_fast_food': 'Lanches',
      'cat_restaurant': 'Restaurante',
      'cat_inn': 'Pousada',
      'cat_tour_agency': 'Agência',
      'cat_beauty_salon': 'Beleza',

      'des_vale': 'transfer - turismo',
      'des_saopaulo': 'transfer - ecoturismo',
      'des_tigre': 'transfer - turismo',

      'des_jacare': 'restaurante - comida típica',
      'des_bambu': 'restaurante - comida típica',
      'des_saborear': 'restaurante - comida típica',
      'des_terral': 'restaurante - comida típica',
      'des_mangue': 'restaurante - comida típica',

      'des_pousada_paraíso_do_lencois': 'pousada - ambiente acolhedor',
      'des_pousada_casa_dunas': 'pousada - ambiente acolhedor',
      'des_pousada_gran_lençóis_flat': 'pousada - ambiente acolhedor',
      'des_pousada_hotel_pousada_do_buriti': 'pousada - ambiente acolhedor',
      'des_pousada_barreirinhas': 'pousada - ambiente acolhedor',
      'des_pousada_encantes_do_nordeste': 'pousada - ambiente acolhedor',
      'des_pousada_toca_do_vaidoso': 'pousada - ambiente acolhedor',
      'des_pousada_vila_de_charme': 'pousada - ambiente acolhedor',
      'des_pousada_vilas_boas': 'pousada - ambiente acolhedor',
      'des_pousada_do_rio_barreirinhas': 'pousada - ambiente acolhedor',
      'des_pousada_jm_pousada_barreirinhas': 'pousada - ambiente acolhedor',
      'des_pousada_rio_preguiça_hotel': 'pousada - ambiente acolhedor',
      'des_pousada_recanto_dos_lençóis': 'pousada - ambiente acolhedor',
      'des_pousada_do_gaúcho': 'pousada - ambiente acolhedor',
      'des_pousada_atairu': 'pousada - ambiente acolhedor',
      'des_pousada_recanto_das_árvore': 'pousada - ambiente acolhedor',

      'cat_prog': 'Aprenda a lógica de Programação e se destaque!',
      'cat_read': 'Aprenda caligrafia e melhore sua escrita',
      'cat_fest':'Venha prestigiar a festa conhecida e popular de Barreirinhas',
      'cat_hea': 'Já começou a campanha de vacinação ganha E traga sua carteira!'
    },

    'en': {
      'home_title': 'Home',
      'profile_title': 'Profile',
      'explore_title': 'Explore',
      'transfer_title': 'Transfer',
      'events_title': 'Events',
      'search_hint': 'Search your destination',
      'popular_restaurants': 'Popular Restaurants',
      'popular_inns': 'Popular Inns',
      'popular_travel_agency': 'Popular Travel Agencies',
      'see_more': 'see more',
      'open_all_day': 'Open',
      'time_24h': '24 Hours',
      'cat_location': 'Location',
      'description_label': 'Description',

      'cat_culture': 'Cultura',
      'cat_education': 'Education',
      'cat_culture_sport': 'Culture/Sport',
      'cat_musical': 'Musical',
      'cat_health': 'Health',
      'cat_crafts': 'Craftsmanship',

      'description_barreirinhas':
          'Inn located in the heart of the city of Lençóis, known for its hospitality and cozy atmosphere.',
      'description_boa_vista':
          'Inn located in the heart of the city of Lençóis, known for its hospitality and cozy atmosphere.',
      'description_rancho':
          'Inn located in the heart of the city of Lençóis, known for its hospitality and cozy atmosphere.',
      'description_vale':
          'Tour agency located in the heart of the city of Lençóis, known for its amazing tours and quality service.',
      'description_saborear':
          'Restaurant located in the heart of the city of Lençóis, known for its typical food and cozy atmosphere.',
      'description_bambu':
          'Restaurant located in the heart of the city of Lençóis, known for its typical food and cozy atmosphere.',
      'description_jacare':
          'Restaurant located in the heart of the city of Lençóis, known for its typical food and cozy atmosphere.',

      'text_directions': 'Open in Google Maps to see the route',
      'map_title': 'Location',
      'cat_laundry': 'Laundry',
      'cat_handcraft': 'Handcraft',
      'cat_sweet': 'Sweet',
      'cat_fast_food': 'Fast Food',
      'cat_restaurant': 'Restaurant',
      'cat_inn': 'Inn',
      'cat_tour_agency': 'Agency',
      'cat_beauty_salon': 'Beauty',

      'des_vale': 'transfer - tourism',
      'des_saopaulo': 'transfer - ecotourism',
      'des_tigre': 'transfer - tourism',

      'des_pousada_paraíso_do_lencois': 'Cozy & Charming',
      'des_pousada_casa_dunas': 'Cozy & Charming',
      'des_pousada_gran_lençóis_flat': 'Cozy & Charming',
      'des_pousada_hotel_pousada_do_buriti': 'Cozy & Charming',
      'des_pousada_barreirinhas': 'Cozy & Charming',
      'des_pousada_encantes_do_nordeste': 'Cozy & Charming',
      'des_pousada_toca_do_vaidoso': 'Cozy & Charming',
      'des_pousada_vila_de_charme': 'Cozy & Charming',
      'des_pousada_vilas_boas': 'Cozy & Charming',
      'des_pousada_do_rio_barreirinhas': 'Cozy & Charming',
      'des_pousada_jm_pousada_barreirinhas': 'Cozy & Charming',
      'des_pousada_rio_preguiça_hotel': 'Cozy & Charming',
      'des_pousada_recanto_dos_lençóis': 'Cozy & Charming',
      'des_pousada_do_gaúcho': 'Cozy & Charming',
      'des_pousada_atairu': 'Cozy & Charming',
      'des_pousada_recanto_das_árvore': 'Cozy & Charming',

      'cat_prog': 'Learn programming logic and excel!',
      'cat_read': 'Learn calligraphy and improve your handwriting.',
      'cat_arte': 'Learn about Buriti fiber used to make handicrafts.',
      'cat_fest':'Come and enjoy the well-known and popular festival of Barreirinhas.',
      'cat_hea': 'The vaccination campaign has already started! Bring your vaccination card.'
    },

    'es': {
      'home_title': 'Inicio',
      'profile_title': 'Perfil',
      'explore_title': 'Explorar',
      'transfer_title': 'Translado',
      'events_title': 'Eventos',
      'search_hint': 'Busca tu destino',
      'popular_restaurants': 'Restaurantes Populares',
      'popular_inns': 'Posadas Populares',
      'popular_travel_agency': 'Agencias de Turismo',
      'see_more': 'ver más',
      'open_all_day': 'Abierto',
      'time_24h': '24 Horas',
      'cat_location': 'Ubicación',
      'description_label': 'Descripción',

      'cat_culture': 'Cultura',
      'cat_education': 'Educación',
      'cat_culture_sport': 'Cultura/Deporte',
      'cat_musical': 'Musical',
      'cat_health': 'Bienestar de la Salud',
      'cat_crafts': 'Artesanía',

      'description_barreirinhas':
          'Posada ubicada en el corazón de la ciudad de Lençóis, conocida por su hospitalidad y ambiente acogedor.',
      'description_boa_vista':
          'Posada ubicada en el corazón de la ciudad de Lençóis, conocida por su hospitalidad y ambiente acogedor.',
      'description_rancho':
          'Posada ubicada en el corazón de la ciudad de Lençóis, conocida por su hospitalidad y ambiente acogedor.',
      'description_vale':
          'Agencia de turismo ubicada en el corazón de la ciudad de Lençóis, conocida por sus increíbles paseos y servicio de calidad.',
      'description_saborearte':
          'Restaurante ubicado en el corazón de la ciudad de Lençóis, conocido por su comida típica y ambiente acogedor.',
      'description_bambu':
          ' Restaurante ubicadoen el corazón de la ciudad de Lençóis, conocido por su comida típica y ambiente acogedor',

      'description_jacare':
          'Restaurante ubicado en el corazón de la ciudad de Lençóis, conocido por su comida típica y ambiente acogedor.',

      'map_title': 'Ubicación',
      'text_directions': 'Abrir no Googles Maps para ver a rota',
      'cat_laundry': 'Lavandería',
      'cat_handcraft': 'Artesanía',
      'cat_sweet': 'Doceria',
      'cat_fast_food': 'Lanches',
      'cat_restaurant': 'Restaurante',
      'cat_inn': 'Posada',
      'cat_tour_agency': 'Agencia',
      'cat_beauty_salon': 'Belleza',

      'des_vale': 'transfer - turismo',
      'des_saopaulo': 'transfer - ecoturismo',
      'des_tigre': 'transfer - turismo',

      'des_pousada_paraíso_do_lencois': 'pousada - ambiente acolhedor',
      'des_pousada_casa_dunas': 'pousada - ambiente acolhedor',
      'des_pousada_gran_lençóis_flat': 'pousada - ambiente acolhedor',
      'des_pousada_hotel_pousada_do_buriti': 'pousada - ambiente acolhedor',
      'des_pousada_barreirinhas': 'pousada - ambiente acolhedor',
      'des_pousada_encantes_do_nordeste': 'pousada - ambiente acolhedor',
      'des_pousada_toca_do_vaidoso': 'pousada - ambiente acolhedor',
      'des_pousada_vila_de_charme': 'pousada - ambiente acolhedor',
      'des_pousada_vilas_boas': 'pousada - ambiente acolhedor',
      'des_pousada_do_rio_barreirinhas': 'pousada - ambiente acolhedor',
      'des_pousada_jm_pousada_barreirinhas': 'pousada - ambiente acolhedor',
      'des_pousada_rio_preguiça_hotel': 'pousada - ambiente acolhedor',
      'des_pousada_recanto_dos_lençóis': 'pousada - ambiente acolhedor',
      'des_pousada_do_gaúcho': 'pousada - ambiente acolhedor',
      'des_pousada_atairu': 'pousada - ambiente acolhedor',
      'des_pousada_recanto_das_árvore': 'pousada - ambiente acolhedor',

      'cat_prog': '¡Aprenda lógica de programación y Excel!',
      'cat_read': 'Aprenda caligrafía y mejore su escritura a mano.',
      'cat_arte':'Conozca la fibra de Buriti utilizada para elaborar artesanías.',
      'cat_fest':'Ven a disfrutar de la conocida y popular fiesta de las Barreirinhas.',
      'cat_hea': '¡La campaña de vacunación ya ha comenzado! Trae tu cartilla de vacunación.'
    },
  };
}
