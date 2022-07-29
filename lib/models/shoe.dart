class Product {
  final String name;
  final String image;
  final double price;
  bool isFavorite = false;
  final double rating;
  final List<int> sizes;

  String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    this.rating = 0,
    this.sizes = const [39, 40, 42, 43, 44],
  });

  String get path => 'assets/shoes/$image';

  void updateFavourite() {
    isFavorite = !isFavorite;
  }
}
