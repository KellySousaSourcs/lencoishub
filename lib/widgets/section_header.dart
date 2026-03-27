import 'package:flutter/material.dart';
import 'package:lencois_hub/utils/translations.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const SectionHeader({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              Translator.t('see_more'),
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
