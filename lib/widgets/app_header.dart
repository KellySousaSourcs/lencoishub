import 'package:flutter/material.dart';
import '../utils/translations.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBack;

  const AppHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo_lencoishub.png', // 👈 SUA LOGO
            height: 76,
            width: 76,
          ),
          // 🔙 botão voltar (opcional)
          if (showBackButton)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onBack ?? () => Navigator.pop(context),
              ),
            ),

          const SizedBox(height: 10),

          // 🏷 título
          Text(
            title,
            style: const TextStyle(fontFamily: 'achiko', fontSize: 24),
          ),

          const SizedBox(height: 15),

          // 🔍 search bar (a mesma da home)
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3EB),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xff625555)),
                const SizedBox(width: 8),
                Text(
                  Translator.t('search_hint'),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
