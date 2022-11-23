import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/order.dart';

import '../providers/cart.dart';
import '../widgets/cart_item.dart' as c_i;
import 'order_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Order has ben placed.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Thanks for using our app'),
                Text('Shop more!!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Go to home'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            TextButton(
              child: const Text('See orders'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routName);
              },
            ),
          ],
        );
      },
    );
  }

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
                            onTap: () {
                              Provider.of<Orders>(context, listen: false)
                                  .addOrder(cart.items.values.toList(),
                                      cart.totalAmmount);
                              cart.clear();
                              showMyDialog(context);
                            },
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
            const SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (context, index) => c_i.CartItem(
                  id: cart.items.values.toList()[index].id,
                  productId: cart.items.keys.toList()[index],
                  title: cart.items.values.toList()[index].title,
                  quantity: cart.items.values.toList()[index].quantity,
                  price: cart.items.values.toList()[index].price,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
