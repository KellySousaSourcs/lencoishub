import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final String imagePath;

  const CategoryItem({super.key, required this.label, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffd9d9d9),
              border: Border.all(color: Color(0xffd9d9d9), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
              fontFamily: 'Montserrat-Medium',
            ),
          ),
        ],
      ),
    );
  }
}
