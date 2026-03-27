import 'package:flutter/material.dart';

class PlaceListItem extends StatelessWidget {
  final String name;
  final String image;
  final double rating;
  final String subtitle;
  final VoidCallback? onTap;

  const PlaceListItem({
    super.key,
    required this.name,
    required this.image,
    required this.rating,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(image, width: 60, height: 60, fit: BoxFit.cover),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          const Icon(Icons.star_half_rounded, color: Colors.amber, size: 16),
          Text(rating.toString()),
          const SizedBox(width: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
    );
  }
}
