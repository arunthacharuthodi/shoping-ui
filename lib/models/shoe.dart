class Product {
  final String name;
  final String image;
  final double price;
  bool isFavorite = false;
  final double rating;
  // final List<int> sizes;

  String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do  et dolore magna aliqua. Ut enim ad minim veniam, quis qui officia deserunt mollit anim id est laborum.",
    this.rating = 0,
  });

  String get path => 'assets/shoes/$image';

  void updateFavourite() {
    isFavorite = !isFavorite;
  }
}
