//import 'dart:html';

import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String productName;
  final String image;
  final int price;
  final int quantity;
  bool available;

  Cart(
      {this.id,
      this.productName,
      this.image,
      this.price,
      this.quantity,
      this.available});
}

class Cartitem with ChangeNotifier {
  List<Cart> _items = [];

  List<Cart> get items {
    return [..._items];
  }

  void tooglePicked(index) {
    _items[index].available = !_items[index].available;
    notifyListeners();
  }

  void addItem(
      {String id,
      String productname,
      String image,
      int price,
      int quantity,
      bool avail}) {
    if (_items.any((element) => element.id == id)) {
      return;
    } else {
      _items.add(Cart(
        id: id,
        productName: productname,
        image: image,
        price: price,
        available: avail,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }
}
