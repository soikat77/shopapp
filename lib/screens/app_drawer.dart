import 'package:flutter/material.dart';
import 'package:shopapp/screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Hi bro!'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.shop),
          title: const Text('Shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.shopping_bag),
          title: const Text('Order'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routName);
          },
        ),
      ]),
    );
  }
}
