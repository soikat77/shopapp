import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/app_drawer.dart';

import '../providers/order.dart' show Orders;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routName = '/orders';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (context, index) => OrderedItem(
          order: ordersData.orders[index],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
