import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_shop/screens/products_overview_screen.dart';
import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:my_shop/providers/products.dart';
import 'package:my_shop/providers/cart.dart';

void main() {
  runApp(MyApp());
}

// Multiple providers
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (routeContext) => ProductDetailScreen(), 
        }
      ),
    );
  }
}

// // Single provider
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (ctx) => Products(),
//         child: MaterialApp(
//           title: 'MyShop',
//           theme: ThemeData(
//             primarySwatch: Colors.purple,
//             accentColor: Colors.deepOrange,
//             fontFamily: 'Lato',
//           ),
//           home: ProductsOverviewScreen(),
//           routes: {
//             ProductDetailScreen.routeName: (routeContext) => ProductDetailScreen(), 
//           }
//         ),
//     );
//   }
// }

