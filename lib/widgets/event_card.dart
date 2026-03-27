import 'package:flutter/material.dart';
import 'package:lencois_hub/screens/universal_detail_screen.dart';
import 'package:lencois_hub/utils/translations.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> eventData;

  const EventCard({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UniversalDetailsScreen(data: eventData),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: BoxBorder.symmetric(
            vertical: BorderSide(color: Color(0xffd9d9d9)),
          ),
          color: const Color(0xFFF6F6E7),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 4,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Lado Esquerdo: Imagem
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                eventData['image'],
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            // Lado Direito: Informações
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventData['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${Translator.t('cat_location')}: ${eventData['location']}",
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  // Categoria com ícone ou cor diferente
                  Text(
                    Translator.t(eventData['category']),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff019879),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 3), // Espaçamento entre o conteúdo e a data
            // Data/Hora na ponta direita
            Column(
              children: [
                Text(
                  eventData['day'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(eventData['month'].substring(0, 3).toUpperCase()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
