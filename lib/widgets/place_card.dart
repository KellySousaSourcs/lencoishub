import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String rating;
  final VoidCallback? onTap;

  const PlaceCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only( right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xffd9d9d9), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Color(
                      0xffd9d9d9,
                    ).withValues(alpha: 1), // sombra bem suave
                    blurRadius: 4,
                    offset: Offset(2, 2), // sombra para baixo
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Row(
                    children: [
                      Text(rating, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      Icon(Icons.star, size: 14, color: Colors.orange),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
