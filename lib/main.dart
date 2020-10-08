import 'package:Krushi_Sarathi/Screens/ContactusPage.dart';
import 'package:Krushi_Sarathi/Screens/HomePage.dart';
import 'package:Krushi_Sarathi/Screens/UserProfilePage.dart';
import 'package:Krushi_Sarathi/Screens/login.dart';
import 'package:Krushi_Sarathi/Screens/signup.dart';
import 'package:Krushi_Sarathi/Screens/tabsscreen.dart';
import 'package:flutter/material.dart';
import './Screens/CartPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Krushi Sarathi',
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignupPage(),
        TabsScreen.routename: (BuildContext context) => TabsScreen(),
        HomePage.routename: (BuildContext context) => HomePage(),
        CartPage.routename: (BuildContext context) => CartPage(),
        ContactUsPage.routename: (BuildContext context) => ContactUsPage(),
        UserProfilePage.routename: (BuildContext context) => UserProfilePage()
      },
    );
  }
}
