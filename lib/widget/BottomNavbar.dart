import 'package:Krushi_Sarathi/Screens/CartPage.dart';
import 'package:Krushi_Sarathi/Screens/ContactusPage.dart';
import 'package:Krushi_Sarathi/Screens/HomePage.dart';
import 'package:Krushi_Sarathi/Screens/UserProfilePage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class BottomNavBar extends StatelessWidget {
  final int value;
  BottomNavBar(this.value);
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: value,
      color: primaryColor,
      backgroundColor: Colors.transparent,
      height: 50,
      items: [
        Icon(
          Icons.home,
          size: 30,
          color: Colors.white,
        ),
        Icon(Icons.phone, size: 30, color: Colors.white),
        Icon(Icons.shopping_cart, size: 30, color: Colors.white),
        Icon(Icons.account_circle, size: 30, color: Colors.white),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushNamed(HomePage.routename);
        }
        if (index == 1) {
          Navigator.of(context).pushNamed(ContactUsPage.routename);
        }
        if (index == 2) {
          Navigator.of(context).pushNamed(CartPage.routename);
        }
        if (index == 3) {
          Navigator.of(context).pushNamed(UserProfilePage.routename);
        }
      },
    );
  }
}
