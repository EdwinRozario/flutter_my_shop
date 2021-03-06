import 'package:flutter/material.dart';

import 'package:my_shop/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Sven Ulof',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Pan',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Kristina',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Nystrom',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // var _showFavOnly = false;

  List<Product> get items {
    // if (_showFavOnly) {
    //   return _items.where((item) => item.isFavorite).toList();
    // }

    return [..._items];
  }

  List<Product> get favourites {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  // void showAll() {
  //   _showFavOnly = false;

  //   notifyListeners();
  // }

  // void showOnlyFavs() {
  //   _showFavOnly = true;

  //   notifyListeners();
  // }

  void addProduct() {
    // _tems.add(new values);
    
    // This method will notify all components listening
    // to Products that there was a change and they will
    // all rebuild
    notifyListeners();
  }
}