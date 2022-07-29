import 'package:ekraft/models/shoe.dart';

class ShoeStore {
  static List<Product> shoes = [
    Product(
      name: "Nike Blue Outdoor Sport",
      image: "nike-blue.png",
      price: 24.50,
      rating: 4.7,
    ),
    Product(
      name: "Nike Neon Green Shoes",
      image: "nike-neon.png",
      price: 32.70,
      rating: 4.9,
    ),
    Product(
      name: "Adidas Pink Sport Shoes",
      image: "adidas-pink.png",
      price: 56.50,
      rating: 3.8,
    ),
    Product(
      name: "Nike Red Black Sport",
      image: "nike-red-black.png",
      price: 143.0,
      rating: 5,
    ),
    Product(
      name: "Adidas Outdoor Sport",
      image: "adidas-sport-outside.png",
      price: 62.80,
      rating: 4.2,
    ),
    Product(
      name: "Nike Slim Sport Shoes",
      image: "nike-slim-sport.png",
      price: 92.80,
      rating: 4.5,
    ),
  ];
}

bool isAuthenticated = false;
