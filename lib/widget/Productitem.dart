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
    final mediaquery = MediaQuery.of(context);
    final totalHeight =
        mediaquery.size.height - mediaquery.padding.top - kToolbarHeight;
    final totalWidth = mediaquery.size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.routename, arguments: id);
      },
      //splashColor: ,
      child: Container(
        margin: EdgeInsets.all(10),

        ///height: 300,
        width: 180,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Divider(
              color: Colors.black54,
              thickness: 1.5,
              indent: 5,
              endIndent: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '₹${price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton.icon(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                label: Text('Add'),
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
