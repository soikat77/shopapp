import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red T-Shirt',
      details: 'A Red T-Shirt, Pretty and Comfortable',
      price: 25.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2013/07/13/14/08/apparel-162192_1280.png',
    ),
    Product(
      id: 'p2',
      title: 'Laptop ',
      details: 'A powerful Laptop for productivity',
      price: 199.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_1280.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Birthday Cake',
      details: 'Tasty Birthday Cake for birthday celibration',
      price: 65.50,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/03/18/01/09/cupcake-1264214_1280.png',
    ),
    Product(
      id: 'p4',
      title: 'Stylish Shoe',
      details:
          'A very Stylish Shoe for men. Its so comfortable and nice looking',
      price: 80.00,
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/06/18/18/41/running-shoe-371624_1280.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
