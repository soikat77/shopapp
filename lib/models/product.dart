class Product {
  final String id;
  final String title;
  final String details;
  final double price;
  final String imageUrl;
  bool? isWishlist;

  Product({
    required this.id,
    required this.title,
    required this.details,
    required this.price,
    required this.imageUrl,
    this.isWishlist = false,
  });
}
