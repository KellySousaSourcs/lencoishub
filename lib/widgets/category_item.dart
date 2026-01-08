import 'package:flutter/material.dart';
import '../utils/translations.dart';

class CategoryItem extends StatelessWidget {
  final String image;
  final String labelKey;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.image,
    required this.labelKey,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFD9D9D9), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFfd9d9d9).withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            Translator.t(labelKey),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
