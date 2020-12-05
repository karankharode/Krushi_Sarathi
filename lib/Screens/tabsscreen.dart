import 'package:Krushi_Sarathi/Screens/CartPage.dart';
import 'package:Krushi_Sarathi/Screens/drawerScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:Krushi_Sarathi/Screens/ContactusPage.dart';
import 'package:Krushi_Sarathi/Screens/HomePage.dart';
import 'package:Krushi_Sarathi/Screens/UserProfilePage.dart';
import 'package:Krushi_Sarathi/Screens/wishlistPage.dart';
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
    _pages = [];
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Krishi Sarthi'),
          backgroundColor: drawerColor,
          actions: [Icon(EvaIcons.search), Icon(EvaIcons.share)],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(EvaIcons.home),
              ),
              Tab(
                icon: Icon(EvaIcons.phone),
              ),
              Tab(
                icon: Icon(EvaIcons.heart),
              ),
              Tab(
                icon: Icon(EvaIcons.person),
              )
            ],
          ),
        ),
        drawer: DrawerScreen(),
        body: TabBarView(children: [
          HomePage(),
          ContactUsPage(),
          WishlistPage(),
          UserProfilePage()
        ]),
      ),
    );
    /*return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: CurvedNavigationBar(
          index: _selectedindex,
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
            Icon(Icons.favorite_border, size: 30, color: Colors.white),
            Icon(Icons.account_circle, size: 30, color: Colors.white),
          ],
          onTap: _selectPage),
    );*/
  }
}
