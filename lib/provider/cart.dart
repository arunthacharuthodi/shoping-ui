import 'package:flutter/material.dart';
import 'package:ekraft/models/shoe.dart';

class Cart extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items => _items;
  int get itemCount => _items.length;
  double get totalAmount => _items.fold(0, (sum, item) => sum + item.price);
  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }

  bool get isEmpty => _items.isEmpty;
}
