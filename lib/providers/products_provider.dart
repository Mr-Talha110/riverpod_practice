import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

const List<Product> allProducts = [
  Product(
      id: '1', title: 'Bag', price: 52, image: 'assets/products/backpack.png'),
  Product(id: '2', title: 'Drum', price: 25, image: 'assets/products/drum.png'),
  Product(
      id: '3',
      title: 'Guitar',
      price: 100,
      image: 'assets/products/guitar.png'),
  Product(
      id: '4', title: 'Jeans', price: 100, image: 'assets/products/jeans.png'),
  Product(
      id: '5', title: 'Shorts', price: 65, image: 'assets/products/shorts.png'),
  Product(
      id: '6', title: 'Skates', price: 30, image: 'assets/products/skates.png'),
];
final productsProvider = Provider(
  (ref) => allProducts,
);
final reducedProductProvider = Provider(
  (ref) {
    return allProducts
        .where(
          (element) => element.price < 50,
        )
        .toList();
  },
);
