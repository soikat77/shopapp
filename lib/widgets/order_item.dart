import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/order.dart' as ord;

class OrderedItem extends StatefulWidget {
  // final String title;
  final ord.OrderItem order;

  const OrderedItem({
    super.key,
    required this.order,
  });

  @override
  State<OrderedItem> createState() => _OrderedItemState();
}

class _OrderedItemState extends State<OrderedItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text(
            '\$${widget.order.ammount}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
              DateFormat('dd-MM-yyyy hh:mm').format(widget.order.dateTime)),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                expanded = !expanded;
              });
            },
            icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
          ),
        ),
        if (expanded)
          SizedBox(
            height: min(widget.order.products.length * 20.0 + 10.0, 180.0),
            child: ListView(
                children: widget.order.products
                    .map(
                      (prod) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${prod.title} (${prod.quantity} x ${prod.price}\$)',
                            ),
                            Text('= ${prod.quantity * prod.price} \$'),
                          ],
                        ),
                      ),
                    )
                    .toList()),
          ),
      ]),
    );
  }
}
