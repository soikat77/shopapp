import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: cart.totalAmmount != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(fontSize: 18),
                          ),
                          const Spacer(),
                          Chip(
                            label: Text('\$ ${cart.totalAmmount}'),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {},
                            child: Chip(
                              backgroundColor: Theme.of(context).primaryColor,
                              label: Text(
                                'ORDER NOW',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Text(
                          'Nothing Found. Add something first',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
