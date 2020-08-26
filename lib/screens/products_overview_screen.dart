import 'package:flutter/material.dart';

import 'package:my_shop/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold fills an entire screen with app bar
    // and all that shit included
    return Scaffold(
      appBar: AppBar(title: Text('MyShop')),
      backgroundColor: Colors.grey[300],
      body: ProductsGrid(),
    );
  }
}
