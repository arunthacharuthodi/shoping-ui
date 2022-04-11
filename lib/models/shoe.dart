import 'package:flutter/material.dart';

class Shoe {
  final String name;
  final String image;
  final double price;
  bool isFavorite = false;
  final double rating;
  final List<int> sizes;
  List<Color> colors = [
    const Color(0xFFBBDC81),
    const Color(0xFFFE5A59),
    Colors.black,
    const Color(0xFFFF6BE9),
  ];

  Shoe({
    required this.name,
    required this.image,
    required this.price,
    this.rating = 0,
    this.sizes = const [39, 40, 42, 43, 44],
  });

  String get path => 'assets/shoes/$image';

  void updateFavourite() {
    isFavorite = !isFavorite;
  }
}
