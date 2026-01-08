class AppCategory {
  final String id;
  final String image;
  final String titleKey;

  const AppCategory({
    required this.id,
    required this.image,
    required this.titleKey,
  });
}

const List<AppCategory> appCategories = [
  AppCategory(
    id: 'restaurant',
    image: 'assets/images/categories/restaurant.jpg',
    titleKey: 'cat_restaurant',
  ),
  AppCategory(
    id: 'inn',
    image: 'assets/images/categories/inn.jpg',
    titleKey: 'cat_inn',
  ),
  AppCategory(
    id: 'handcraft',
    image: 'assets/images/categories/handcraft.jpg',
    titleKey: 'cat_handcraft',
  ),
  AppCategory(
    id: 'itineraries',
    image: 'assets/images/categories/itineraries.jpg',
    titleKey: 'cat_itineraries',
  ),
  AppCategory(
    id: 'laundry',
    image: 'assets/images/categories/laundry.jpg',
    titleKey: 'cat_laundry',
  ),
  AppCategory(
    id: 'tour_agency',
    image: 'assets/images/categories/tour_agency.jpg',
    titleKey: 'cat_tour_agency',
  ),
  AppCategory(
    id: 'bar',
    image: 'assets/images/categories/bar.jpg',
    titleKey: 'cat_bar',
  ),
  AppCategory(
    id: 'square',
    image: 'assets/images/categories/square.jpg',
    titleKey: 'cat_square',
  ),
  AppCategory(
    id: 'beauty_salon',
    image: 'assets/images/categories/beauty_salon.jpg',
    titleKey: 'cat_beauty_salon',
  ),
  AppCategory(
    id: 'clothing_store',
    image: 'assets/images/categories/clothing_store.jpg',
    titleKey: 'cat_clothing_store',
  ),
  AppCategory(
    id: 'icecream',
    image: 'assets/images/categories/ice_cream_shop.jpg',
    titleKey: 'cat_icecream',
  ),
];
