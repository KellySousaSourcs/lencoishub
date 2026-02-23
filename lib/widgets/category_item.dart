import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final String imagePath;

  const CategoryItem({super.key, required this.label, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Color(0xffd9d9d9),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
