import 'package:Krushi_Sarathi/Screens/LoginPage.dart';
import 'package:Krushi_Sarathi/authService.dart';
import 'package:Krushi_Sarathi/provider/Cartitem.dart';
import 'package:Krushi_Sarathi/Screens/ProductPage.dart';
import 'package:Krushi_Sarathi/Screens/ContactusPage.dart';
import 'package:Krushi_Sarathi/Screens/HomePage.dart';
import 'package:Krushi_Sarathi/Screens/UserProfilePage.dart';
import 'package:Krushi_Sarathi/Screens/tabsscreen.dart';
import 'package:Krushi_Sarathi/Screens/wishlistPage.dart';
import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Screens/CartPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  SharedPreferences.setMockInitialValues({});
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await Firebase.initializeApp();

    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cartitem())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Krushi Sarathi',
        home: AuthServices().handleAuth(),
        routes: <String, WidgetBuilder>{
          LoginPage.routename: (ctx) => LoginPage(),
          TabsScreen.routename: (BuildContext context) => TabsScreen(),
          HomePage.routename: (BuildContext context) => HomePage(),
          CartPage.routename: (BuildContext context) => CartPage(),
          ContactUsPage.routename: (BuildContext context) => ContactUsPage(),
          UserProfilePage.routename: (BuildContext context) =>
              UserProfilePage(),
          ProductPage.routename: (BuildContext context) => ProductPage(),
          WishlistPage.routename: (BuildContext context) => WishlistPage(),
        },
      ),
    );
  }
}
