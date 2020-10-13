import 'package:Krushi_Sarathi/ProductPage.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String image;
  final String description;
  final String price;

  ProductItem(this.id, this.title, this.price, this.description, this.image);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.routename, arguments: id);
      },
      //splashColor: ,
      child: Container(
        //height: 100,
        width: 150,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.greenAccent,
            gradient: LinearGradient(colors: [
              Colors.orange,
              Colors.yellow,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "₹ ${price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Icon(
                  Icons.shopping_cart,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
