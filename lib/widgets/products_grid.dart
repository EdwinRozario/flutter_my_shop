import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:my_shop/widgets/product_item.dart';
import 'package:my_shop/providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFav;

  ProductsGrid(this.showOnlyFav);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showOnlyFav ? productsData.favourites : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        // Better to use value here as the Product object is already created
        // In main file better to create as its the start point
        // create: (c) => products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}