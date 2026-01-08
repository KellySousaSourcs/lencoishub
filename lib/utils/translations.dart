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
      'profile': 'Perfil',
      'explore': 'Explorar',
      'welcome': 'Bem-vindo',
      'search_hint': 'Pesquise seu destino',
      'popular_restaurants': 'Restaurantes Populares',
      'see_more': 'Ver mais',

      'cat_laundry': 'Lavanderia',
      'cat_handcraft': 'Artesanato',
      'cat_bar': 'Bar',
      'cat_square': 'Praça',
      'cat_restaurant': 'Restaurante',
      'cat_inn': 'Pousada',
      'cat_icecream': 'Sorveteria',
      'cat_tour_agency': 'Agência de Turismo',
      'cat_beauty_salon': 'Salão de Beleza',
      'cat_clothing_store': 'Loja de Roupas',
      'cat_itineraries': 'Roteiros',
    },

    'en': {
      'home_title': 'Home',
      'profile': 'Profile',
      'explore': 'Explore',
      'welcome': 'Welcome',
      'search_hint': 'Search your destination',
      'popular_restaurants': 'Popular Restaurants',
      'see_more': 'See more',

      'cat_laundry': 'Laundry',
      'cat_handcraft': 'Handcraft',
      'cat_bar': 'Bar',
      'cat_square': 'Square',
      'cat_restaurant': 'Restaurant',
      'cat_inn': 'Inn',
      'cat_icecream': 'Ice Cream Shop',
      'cat_tour_agency': 'Tour Agency',
      'cat_beauty_salon': 'Beauty Salon',
      'cat_clothing_store': 'Clothing Store',
      'cat_itineraries': 'Itineraries',
    },

    'es': {
      'home_title': 'Inicio',
      'profile': 'Perfil',
      'explore': 'Explorar',
      'welcome': 'Bienvenido',
      'search_hint': 'Busca tu destino',
      'popular_restaurants': 'Restaurantes Populares',
      'see_more': 'Ver más',

      'cat_laundry': 'Lavandería',
      'cat_handcraft': 'Artesanía',
      'cat_bar': 'Bar',
      'cat_square': 'Plaza',
      'cat_restaurant': 'Restaurante',
      'cat_inn': 'Posada',
      'cat_icecream': 'Heladería',
      'cat_tour_agency': 'Agencia de Turismo',
      'cat_beauty_salon': 'Salón de Belleza',
      'cat_clothing_store': 'Tienda de Ropa',
      'cat_itineraries': 'Rutas',
    },
  };
}
