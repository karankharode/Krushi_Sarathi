import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier {
  final String id;
  final String productName;
  final String image;
  final String price;
  final String description;
  bool avaliable;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.description,
      @required this.image,
      @required this.price,
      @required this.productName,
      @required this.avaliable,
      @required this.isFavorite});

  void toogleFavorite(item) {
    item.isFavorite = !item.isFavorite;
    print('added');
    notifyListeners();
  }
}
