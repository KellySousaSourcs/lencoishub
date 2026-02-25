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
      'cat_bar': 'Bar',
      'cat_square': 'Praça',
      'cat_restaurant': 'Restaurante',
      'cat_inn': 'Pousada',
      'cat_tour_agency': 'Agência de Turismo',
      'cat_beauty_salon': 'Salão de Beleza',
      'cat_clothing_store': 'Loja de Roupas',
      'cat_itineraries': 'Roteiros',
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
      'cat_bar': 'Bar',
      'cat_square': 'Square',
      'cat_restaurant': 'Restaurant',
      'cat_inn': 'Inn',
      'cat_tour_agency': 'Tour Agency',
      'cat_beauty_salon': 'Beauty Salon',
      'cat_clothing_store': 'Clothing Store',
      'cat_itineraries': 'Itineraries',
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
      'popular_travel_agency': 'Agencias de Turismo Populares',
      'see_more': 'ver más',
      'open_all_day': 'Abierto',
      'time_24h': '24 Horas',
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
      'cat_bar': 'Bar',
      'cat_square': 'Plaza',
      'cat_restaurant': 'Restaurante',
      'cat_inn': 'Posada',
      'cat_tour_agency': 'Agencia de Turismo',
      'cat_beauty_salon': 'Salón de Belleza',
      'cat_clothing_store': 'Tienda de Ropa',
      'cat_itineraries': 'Rutas',
    },
  };
}
