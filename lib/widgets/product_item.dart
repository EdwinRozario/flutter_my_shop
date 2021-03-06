import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:my_shop/providers/product.dart';
import 'package:my_shop/providers/cart.dart';

// Provider implementation with consumre to the only
// bit(ie favorite icon) that will change
class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: Consumer<Product>(
          builder: (ctx, product, _child) => IconButton(
            alignment: Alignment.topRight,
            icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: () => product.toggleFavoriteStatus(),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added an item to cart'),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.removeItem(product.id);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ), 
    );
  }
}

// Provider inmplementation that affects all the component on change
// class ProductItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final product = Provider.of<Product>(context);

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(7.0),
//       child: GridTile(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pushNamed(
//               ProductDetailScreen.routeName,
//               arguments: product.id,
//             );
//           },
//           child: Image.network(
//             product.imageUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//         header: IconButton(
//           alignment: Alignment.topRight,
//           icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
//           color: Theme.of(context).accentColor,
//           onPressed: () => product.toggleFavoriteStatus(),
//         ),
//         footer: GridTileBar(
//           backgroundColor: Colors.black87,
//           title: Text(
//             product.title,
//             textAlign: TextAlign.center
//           ),
//           trailing: IconButton(
//             icon: Icon(Icons.shopping_cart),
//             color: Theme.of(context).accentColor,
//             onPressed: () {},
//           ),
//         ),
//       ), 
//     );
//   }
// }

