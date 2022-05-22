import 'package:flutter/material.dart';
import 'package:fruit_app/models/Product.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart(this.product, this.numOfItems);
}

List<Cart> demoCarts = [
  Cart(demoProducts[0], 2),
  Cart(demoProducts[1], 1),
  Cart(demoProducts[3], 3),
];
