import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage;
  bool _isExpanded = false;

  final List<Map<String, String>> _languages = [
    {'label': '🇧🇷 Português', 'code': 'pt'},
    {'label': '🇺🇸 English (US)', 'code': 'en'},
    {'label': '🇪🇸 Español', 'code': 'es'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Fundo
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 60,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  'Lençóis Hub!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'achiko',
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Seu guia turístico de Barreirinhas MA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat-Medium',
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Conteúdo
          Positioned(
            top: screenSize.height * 0.45,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _languageSelector(),
                const SizedBox(height: 12),
                if (_isExpanded) _languageOptions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _languageSelector() {
    return GestureDetector(
      onTap: () {
        setState(() => _isExpanded = !_isExpanded);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language),
            const SizedBox(width: 10),
            Text(
              _selectedLanguage ?? 'Selecione o idioma',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(width: 8),
            Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
          ],
        ),
      ),
    );
  }

  Widget _languageOptions() {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xff015d55).withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: _languages.map(_buildLangOption).toList()),
    );
  }

  Widget _buildLangOption(Map<String, String> lang) {
    return GestureDetector(
      onTap: () => _selectLanguage(lang),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          lang['label']!,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Future<void> _selectLanguage(Map<String, String> lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang['code']!);

    if (!mounted) return;

    setState(() {
      _selectedLanguage = lang['label'];
      _isExpanded = false;
    });

    Navigator.pushReplacementNamed(context, '/login');
  }
}
