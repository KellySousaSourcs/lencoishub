import 'package:flutter/material.dart';
import '../utils/app_categories.dart';
import 'category_item.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: appCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = appCategories[index];

          return CategoryItem(
            image: category.image,
            labelKey: category.titleKey,
            onTap: () {
              Navigator.pushNamed(context, '/category', arguments: category);
            },
          );
        },
      ),
    );
  }
}
