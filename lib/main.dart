import 'package:Krushi_Sarathi/HomePage.dart';
import 'package:Krushi_Sarathi/login.dart';
import 'package:Krushi_Sarathi/signup.dart';
import 'package:flutter/material.dart';

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
        '/homepage': (BuildContext context) => HomePage(),
      },
    );
  }
}


