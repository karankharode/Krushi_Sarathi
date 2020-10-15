import 'package:Krushi_Sarathi/ProductPage.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  final String description;
  final String price;

  ProductItem(this.id, this.title, this.price, this.description, this.image);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isFav = false;
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.routename,
            arguments: widget.id);
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
            Stack(children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: IconButton(
                    icon: (_isFav)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        _isFav = !_isFav;
                      });
                    }),
                bottom: 0,
                right: 0,
              )
            ]),
            Divider(
              color: Colors.black54,
              thickness: 1.5,
              indent: 5,
              endIndent: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '₹${widget.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton.icon(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {},
                label: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
