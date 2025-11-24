import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/theme.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // informações da tela (largura / altura)
    final Size screenSize = MediaQuery.of(context).size;
    // controle de distância do topo para o título (ajuste aqui)
    final double topTitleOffset = 60.0;

    return Scaffold(
      body: Stack(
        children: [
          // ---------- 1) Fundo com imagem (cobre toda a tela) ----------
          SizedBox.expand(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // ---------- 2) Camada esverdeada no rodapé ----------
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppTheme.primaryColor.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
          ),

          // ---------- 3) Cabeçalho fixo no topo (TÍTULO e SUBTÍTULO) ----------
          // Usamos Positioned para deixá-los "parados" no topo da tela.
          Positioned(
            left: 0,
            right: 0,
            top: topTitleOffset + MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Lençóis Hub!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'achiko',
                    fontSize: 38,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Seu guia turístico de Barreirinhas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat-Medium',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // ---------- 4) Conteúdo interativo central (dropdown + botão) ----------
          // ---------- 4) Conteúdo interativo central (dropdown + botão) ----------
          Positioned(
            left: 0,
            right: 0,
            top: screenSize.height * 0.45,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.language, color: Colors.black54),
                          const SizedBox(width: 10),
                          Text(
                            _selectedLanguage ?? 'Selecione o seu idioma',
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _isExpanded ? Icons.expand_less : Icons.expand_more,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: 220,
                      decoration: BoxDecoration(
                        color: const Color(0xff015d55).withValues(alpha: 0.65),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: _isExpanded
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildLangOption('🇺🇸 English (US)'),
                                _buildLangOption('🇪🇸 Español'),
                                _buildLangOption('🇧🇷 Português'),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ Agora o botão "CONHECER" fica **separado**, mas com a MESMA posição
          Positioned(
            left: 180,
            right: 0,
            bottom: 60, // dois dedos acima como você pediu
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (_selectedLanguage == null) {
                    // Se quiser: mostrar aviso caso a pessoa aperte conhecer sem escolher idioma
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Selecione um idioma primeiro'),
                      ),
                    );
                    return;
                  }

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('language', _selectedLanguage!);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(language: _selectedLanguage!),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff015d55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 20,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Conhecer',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para criar cada idioma
  Widget _buildLangOption(String lang) {
    return GestureDetector(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('language', _getShortCode(lang)); // salva

        Navigator.pushReplacementNamed(context, '/login'); // vai pra login
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          lang,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  String _getShortCode(String lang) {
    if (lang.contains('English')) return 'en';
    if (lang.contains('Español')) return 'es';
    return 'pt';
  }
}
