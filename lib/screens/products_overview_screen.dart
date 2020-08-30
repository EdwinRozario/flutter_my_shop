import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:provider/provider.dart';

import 'package:my_shop/widgets/products_grid.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/providers/cart.dart';

enum FilterOptions { Favorites, All, }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showOnlyFav = false;

  @override
  Widget build(BuildContext context) {
    // final products = Provider.of<Products>(context, listen: false);

    // Scaffold fills an entire screen with app bar
    // and all that shit included
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.Favorites) {
                  showOnlyFav = true;
                  // products.showOnlyFavs();
                } else {
                  showOnlyFav = false;
                  // products.showAll();
                }                
              });

              // if (value == FilterOptions.Favorites) {
              //   products.showOnlyFavs();
              // } else {
              //   showOnlyFav = false;
              //   products.showAll();
              // }

            },
            icon: Icon(Icons.menu),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('All'), value: FilterOptions.All),
              PopupMenuItem(child: Text('Only Favs'), value: FilterOptions.Favorites),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, _child) => Badge(
              child: _child,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: ProductsGrid(showOnlyFav),
    );
  }
}
