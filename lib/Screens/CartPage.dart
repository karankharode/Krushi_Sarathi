import 'package:Krushi_Sarathi/BottomNavbar.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static const routename = '/cartpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Cart page',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
