import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
// import '../providers/products_provider.dart';
import '../screens/product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem({
  //   super.key,
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_outline),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            product.toggleFavorite();
          },
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {},
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
