import 'package:flutter/material.dart';
import '../screens/product_details.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.favorite_outline),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {},
        ),
        title: Text(
          title,
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
            arguments: id,
          );
        },
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain, // BoxFit.cover
        ),
      ),
    );
  }
}
