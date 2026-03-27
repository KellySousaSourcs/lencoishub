import 'package:shared_preferences/shared_preferences.dart';
import 'translations.dart';

class AppLanguage {
  static Future<String> getCurrent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? 'pt';
  }

  static String t(String lang, String key) {
    return AppTranslations.data[lang]?[key] ??
        AppTranslations.data['pt']![key]!;
  }
}