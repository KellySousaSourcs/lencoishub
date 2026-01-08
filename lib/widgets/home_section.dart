import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          CategoryItem(
            image: 'assets/images/categories/laundry.jpg',
            labelKey: 'cat_laundry',
            onTap: () {
              // TODO: ir para lista de lavanderias
            },
          ),
          const SizedBox(width: 16),
          CategoryItem(
            image: 'assets/images/categories/handcraft.jpg',
            labelKey: 'cat_handcraft',
            onTap: () {},
          ),
          const SizedBox(width: 16),
          CategoryItem(
            image: 'assets/images/categories/bar.jpg',
            labelKey: 'cat_bar',
            onTap: () {},
          ),
          const SizedBox(width: 16),
          CategoryItem(
            image: 'assets/images/categories/square.jpg',
            labelKey: 'cat_square',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
