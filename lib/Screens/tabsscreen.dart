import 'package:Krushi_Sarathi/Screens/CartPage.dart';
import 'package:Krushi_Sarathi/Screens/ContactusPage.dart';
import 'package:Krushi_Sarathi/Screens/HomePage.dart';
import 'package:Krushi_Sarathi/Screens/UserProfilePage.dart';
import 'package:Krushi_Sarathi/config.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  static const routename = '/Tabs-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [HomePage(), ContactUsPage(), CartPage(), UserProfilePage()];
    // TODO: implement initState
    super.initState();
  }

  int _selectedindex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: CurvedNavigationBar(
          index: _selectedindex,
          color: primaryColor,
          backgroundColor: Colors.white,
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
          onTap: _selectPage),
    );
  }
}
