import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/order_screen.dart';

import './screens/product_overview.dart';
import './screens/product_details.dart';
import './screens/cart_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          title: 'Shop App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: const ProductOverviewScreen(),
          routes: {
            ProductDetailsScreen.routeName: (context) =>
                const ProductDetailsScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrderScreen.routName: (context) => const OrderScreen(),
          },
        );
      }),
    );
  }
}
