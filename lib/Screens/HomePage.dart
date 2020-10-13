import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:Krushi_Sarathi/widget/Productitem.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rubber/rubber.dart';

import '../config.dart';
import 'package:Krushi_Sarathi/products.dart';
import './drawerScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../ProductPage.dart';

//Class HomePage

class HomePage extends StatefulWidget {
  static const routename = '/homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List bannerAdSlider = [
    "Assets/banner1.png",
    "Assets/banner2.jpg",
    "Assets/banner3.jpg",
    "Assets/banner4.jpg",
    "Assets/banner5.jpg",
    "Assets/banner6.jpg",
    "Assets/banner7.jpg",
    "Assets/banner8.jpg",
  ];
  //Drawer Animation Variables

  double xOffset = 0;
  double yOffset = 0;
  double zOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light));
    final mediaquery = MediaQuery.of(context);
    List<Product> products =
        Provider.of<Products>(context, listen: false).items;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('Krushi Sarathi', style: TextStyle(color: Colors.black87)),
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          actionsIconTheme: IconThemeData(color: Colors.black),

          iconTheme: IconThemeData(color: Colors.black87),

          //drawer button

          leading: isDrawerOpen
              ? IconButton(
                  icon: Icon(EvaIcons.arrowBack),
                  onPressed: () {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      zOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    });
                  },
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      xOffset = 210;
                      yOffset = 40;
                      scaleFactor = 0.9;
                      isDrawerOpen = true;
                    });
                  },
                  icon: Icon(EvaIcons.menu2Outline),
                  iconSize: 30,
                ),

          actions: [
            //Search Button

            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/searchicon');
              },
              icon: Icon(EvaIcons.searchOutline),
              iconSize: 30,
              color: Colors.black87,
            ),

            //Cart Button

            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cartpage');
              },
              icon: Icon(EvaIcons.shoppingBagOutline),
              iconSize: 30,
              color: Colors.black87,
            )
          ],
        ),

        //DrawerScreen and Container(Animated) Stack

        body: Stack(
          children: [
            DrawerScreen(),
            AnimatedContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              duration: Duration(milliseconds: 250),
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor)
                ..rotateY(isDrawerOpen ? -0.5 : 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
                  boxShadow: [
                    BoxShadow(
                      //Body Container Shadow

                      color: drawerColor,
                      spreadRadius: 10,
                      blurRadius: 70,
                    )
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                          height: 200.0,
                          width: double.infinity,
                          child: Carousel(
                            images: [
                              AssetImage("Assets/banner1.png"),
                              AssetImage("Assets/banner2.jpg"),
                              AssetImage("Assets/banner3.jpg"),
                              AssetImage("Assets/banner4.jpg"),
                              AssetImage("Assets/banner5.jpg"),
                              AssetImage("Assets/banner6.jpg"),
                            ],
                            dotSize: 7.0,
                            dotSpacing: 20.0,
                            dotColor: primaryColor,
                            //dotBgColor: Color(0xFFffc107).withOpacity(0.5),
                            indicatorBgPadding: 5.0,
                            borderRadius: true,
                            radius: Radius.circular(20.0),
                            dotIncreaseSize: 1.5,
                          )),
                    ),

                    //bannerAdSlider2 (Carousel)/end

                    //ad banner 1 (Static)
                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: AspectRatio(
                        aspectRatio: 16 / 5,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("Assets/banner7.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),

                    //ad banner3 (Static)/end

                    SizedBox(height: 20),

                    //ProductGrid

                    Container(
                      child: GridView(
                        padding: EdgeInsets.all(20),
                        children: <Widget>[
                          buildCategory('seeds.png', 'Seeds'),
                          buildCategory('fertilizer.jpg', 'Fertilizer'),
                          buildCategory('herbicidesl.jpg', 'Herbicides'),
                          buildCategory('pesticides.jpg', 'Pesticides'),
                        ],
                        primary: false,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: mediaquery.size.width * 0.5,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 10),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      width: 180,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 8, color: Colors.amber)
                            ),
                      ),
                      child: Text(
                        'Featured Products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return ProductItem(
                              products[index].id,
                              products[index].productName,
                              products[index].price,
                              products[index].description,
                              products[index].image);
                        },
                        itemCount: products.length,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));

    //Navigation .
  }

  Widget buildCategory(String image, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.asset(
          'Assets/${image}',
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white54,
        ),
      ),
    );
  }
}
