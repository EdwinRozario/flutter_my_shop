import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id, 
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
   return _items.length; 
  }

  void addItem(String id, double price, String title) {
    if (_items.containsKey(id)) {
      _items.update(id, (item) => CartItem(
          id: item.id,
          quantity: item.quantity + 1,
          price: item.price,
          title: item.title,
        ));
    } else {
      _items.putIfAbsent(id,
        () => CartItem(
          id: DateTime.now().toString(),
          quantity: 1,
          price: price,
          title: title,
        )
      );
    }
    
    notifyListeners();
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      _items.remove(id);
    }

    notifyListeners();
  }
}
