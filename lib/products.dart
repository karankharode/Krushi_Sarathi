import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String productName;
  final String image;
  final String price;
  final String description;

  Product(
      {@required this.id,
      @required this.description,
      @required this.image,
      @required this.price,
      @required this.productName});
}
