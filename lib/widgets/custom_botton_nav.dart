import 'package:flutter/material.dart';
import 'package:lencois_hub/utils/translations.dart';

class CustomBottonNav extends StatelessWidget {
  const CustomBottonNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff019879),
      selectedItemColor: const Color(0xffFFFFFF),
      unselectedItemColor: const Color(0xffFFFFFF).withValues(alpha: 0.7),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: Translator.t('home_title'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.event),
          label: Translator.t('events_title'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.directions_bus),
          label: Translator.t('transfer_title'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          label: Translator.t('explore_title'),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: Translator.t('profile_title'),
        ),
      ],
    );
  }
}
