import 'package:Krushi_Sarathi/provider/Cartitem.dart';
import 'package:Krushi_Sarathi/Screens/ProductPage.dart';
import 'package:Krushi_Sarathi/config.dart';
import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistProduct extends StatelessWidget {
  final id;
  WishlistProduct(this.id);
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Products>(context).favoriteitems;
    final item = items.firstWhere((element) => element.id == id);
    final cart = Provider.of<Cartitem>(context, listen: false);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.routename, arguments: id);
      },
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20, 20, 5),
          child: Material(
            borderRadius: BorderRadius.circular(40.0),
            elevation: 20.0,
            shadowColor: shadowColor,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              width: MediaQuery.of(context).size.width - 40.0,
              height: 140.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0)),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Container(
                    height: 150.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(item.image),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            item.productName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          SizedBox(width: 7.0),
                        ],
                      ),
                      Text(
                        '₹' + item.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: thirdColor),
                      ),
                      SizedBox(height: 7.0),
                      OutlineButton.icon(
                        onPressed: (item.avaliable)
                            ? () {
                                cart.addItem(
                                    id: item.id,
                                    image: item.image,
                                    avail: item.avaliable,
                                    productname: item.productName,
                                    price: 100,
                                    quantity: 3);
                              }
                            : null,
                        borderSide: BorderSide(
                            color: thirdColor,
                            width: 1.0,
                            style: BorderStyle.solid),
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: thirdColor,
                        ),
                        label: Center(
                          child: Text('Add to Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  color: thirdColor)),
                        ),
                      ),
                      SizedBox(height: 7.0),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
