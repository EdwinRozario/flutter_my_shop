import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shop/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    // Extracting params from route
    final productId = ModalRoute.of(context).settings.arguments as String;
    
    // listen: false makes this build method execute only once when loading this page
    // This will not worry about any changes to the Products object like adding a new
    // product, which might be useful for products list page not here.
    final loadedProduct = Provider
                          .of<Products>(context, listen: false)
                          .findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Container(
        child: Image.network(
          loadedProduct.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}