import 'package:Krushi_Sarathi/config.dart';
import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:Krushi_Sarathi/widget/wishlistproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  static const routename = '/wishlist';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final favItems =
        Provider.of<Products>(context, listen: false).favoriteitems;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: drawerColor,
          ),
        ),
        Positioned(
          top: height * 0.2,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80))),
          ),
        ),
        Positioned(
            top: height * 0.1,
            left: width * 0.15,
            child: Text(
              'Wishlist',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
        Positioned(
            top: height * 0.25,
            child: Container(
              height: height * 0.7,
              width: width,
              child: (favItems.length != 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return WishlistProduct(favItems[i].id);
                      },
                      itemCount: favItems.length,
                    )
                  : Center(child: Text('Nothing to show')),
            ))
      ],
    ));
  }
}
