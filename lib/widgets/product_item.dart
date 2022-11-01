import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_details.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider
    final product = Provider.of<Product>(context, listen: true);
    final cart = Provider.of<Cart>(context, listen: false);

    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: Consumer<Product>(
          builder: (context, product, _) => IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              product.toggleFavorite();
            },
          ),
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.add_shopping_cart,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            cart.addItem(product.id, product.price, product.title);
          },
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailsScreen.routeName,
            arguments: product.id,
          );
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.contain, // BoxFit.cover
        ),
      ),
    );
  }
}
