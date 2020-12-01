import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:Krushi_Sarathi/provider/products.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: "l1",
        image: "Assets/product.jpg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Popular dry(1 Kg)",
        avaliable: true,
        isFavorite: false),
    Product(
        id: "l2",
        image: "Assets/product1.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Tynzer(30 ml)",
        avaliable: false,
        isFavorite: false),
    Product(
        id: "l3",
        image: "Assets/product2.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Nuvan (500 ml)",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l4',
        image: "Assets/product3.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Emboz 5% EC",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l5',
        image: "Assets/product4.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Clinton(5 Lt)",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l6',
        image: "Assets/product5.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "ACTION(500 ml)",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l7',
        image: "Assets/product6.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Confider Super",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l8',
        image: "Assets/product7.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "24:24:0",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l9',
        image: "Assets/product8.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Lasso (1 lt)",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l10',
        image: "Assets/product9.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "Glycel (1 lt)",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l11',
        image: "Assets/product10.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "RoundUp",
        avaliable: true,
        isFavorite: false),
    Product(
        id: 'l12',
        image: "Assets/product11.jpeg",
        description:
            "Repudiandae quibusdam quis harum odit.Autem sunt sit. Neque sapiente officia laudantium voluptatem dolores itaque dolore odio. Voluptatem reprehenderit beatae eum eligendi dolorem laborum voluptate nihil vel.",
        price: "100",
        productName: "RECENT Gold",
        avaliable: true,
        isFavorite: false),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findElementById(String id) {
    return items.firstWhere((element) => element.id == id);
  }

  List<Product> get favoriteitems {
    List<Product> favorite = [];
    _items.forEach((product) {
      if (product.isFavorite == true) {
        favorite.add(product);
      }
    });
    notifyListeners();
    return favorite;
  }
}
