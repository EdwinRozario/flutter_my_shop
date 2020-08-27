import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shop/widgets/products_grid.dart';
import 'package:my_shop/providers/products.dart';

enum FilterOptions { Favorites, All, }

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);

    // Scaffold fills an entire screen with app bar
    // and all that shit included
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.Favorites) {
                products.showOnlyFavs();
              } else {
                products.showAll();
              }
            },
            icon: Icon(Icons.menu),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('All'), value: FilterOptions.All),
              PopupMenuItem(child: Text('Only Favs'), value: FilterOptions.Favorites),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: ProductsGrid(),
    );
  }
}
