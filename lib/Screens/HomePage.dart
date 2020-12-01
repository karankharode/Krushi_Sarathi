import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:Krushi_Sarathi/widget/Productitem.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:Krushi_Sarathi/widget/appbar.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rubber/rubber.dart';

import '../config.dart';
import 'package:Krushi_Sarathi/provider/products.dart';
import './drawerScreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'ProductPage.dart';

//Class HomePage

class HomePage extends StatefulWidget {
  static const routename = '/homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  List bannerAdSlider = [
    "Assets/banner1.png",
    "Assets/banner2.jpg",
    "Assets/banner3.jpg",
    "Assets/banner4.jpg",
    "Assets/banner5.jpg",
    "Assets/banner6.jpg",
    //"Assets/banner7.jpg",
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
    final mediaquery = MediaQuery.of(context);
    final totalHeight =
        mediaquery.size.height - mediaquery.padding.top - kToolbarHeight;
    List<Product> products =
        Provider.of<Products>(context, listen: false).items;
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 180.0,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    height: 180.0,
                    initialPage: _current,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    reverse: false,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    itemCount: bannerAdSlider.length,
                    itemBuilder: (context, int index) {
                      return Transform.scale(
                        scale: (index == _current) ? 1 : 0.9,
                        child: ClipRRect(
                          //height: 600,
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            bannerAdSlider[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                )),

            //bannerAdSlider2 (Carousel)/end

            //ad banner 1 (Static)
            SizedBox(
              height: 10,
            ),

            SizedBox(height: 20),

            //ProductGrid
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              width: 120,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 8,
                  color: primaryColor,
                )),
              ),
              child: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

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
              width: 200,
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 8, color: primaryColor)),
              ),
              child: Text(
                'Featured Products',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              width: double.infinity,
              height: 280,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return ProductItem(
                    products[index].id,
                  );
                },
                itemCount: products.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
