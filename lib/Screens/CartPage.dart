import 'dart:ui';

import 'package:Krushi_Sarathi/widget/BottomNavbar.dart';
import 'package:Krushi_Sarathi/provider/Cartitem.dart';
//import 'package:Krushi_Sarathi/widget/CartProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Krushi_Sarathi/config.dart';

class CartPage extends StatefulWidget {
  static const routename = '/cartpage';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    final cartitem = Provider.of<Cartitem>(context).items;

    // List picked = [false, false];

    int getTotal() {
      int total = 0;
      if (cartitem.length == 0) {
        return total;
      } else {
        cartitem.forEach((product) {
          if (product.available) {
            total += product.price * product.quantity;
          }
        });
        return total;
      }
    }

    /* pickToggle(index) {
      setState(() {
        cartitem[index].available = !cartitem[index].available;
        getTotal();
      });
    }*/

    return Scaffold(
        body: Container(
      height: mediaquery.size.height,
      width: mediaquery.size.width,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: mediaquery.padding.top,
              ),
              Container(
                height: mediaquery.size.height * 0.3,
                width: mediaquery.size.width,
                decoration: BoxDecoration(
                    color: drawerColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
            ],
          ),
          Positioned(
            child: Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            top: 130,
            left: 30,
          ),
          Positioned(
            child: Container(
              height: mediaquery.size.height * 0.7,
              width: mediaquery.size.width,
              child: (cartitem.length != 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, j) {
                        return InkWell(
                          onTap: () {
                            Provider.of<Cartitem>(context, listen: false)
                                .tooglePicked(j);
                          },
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 20, 20, 5),
                              child: Material(
                                borderRadius: BorderRadius.circular(40.0),
                                elevation: 20.0,
                                shadowColor: shadowColor,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 15.0, right: 10.0),
                                  width:
                                      MediaQuery.of(context).size.width - 40.0,
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              height: 25.0,
                                              width: 25.0,
                                              decoration: BoxDecoration(
                                                color: cartitem[j].available
                                                    ? Colors.grey
                                                        .withOpacity(0.4)
                                                    : Colors.green
                                                        .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(12.5),
                                              ),
                                              child: Center(
                                                  child: cartitem[j].available
                                                      ? Container(
                                                          height: 12.0,
                                                          width: 12.0,
                                                          decoration: BoxDecoration(
                                                              color: cartitem[j]
                                                                      .available
                                                                  ? thirdColor
                                                                  : Colors.grey
                                                                      .withOpacity(
                                                                          0.4),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0)),
                                                        )
                                                      : Container()))
                                        ],
                                      ),
                                      SizedBox(width: 5.0),
                                      Container(
                                        height: 150.0,
                                        width: 125.0,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    cartitem[j].image),
                                                fit: BoxFit.cover)),
                                      ),
                                      SizedBox(width: 5.0),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                cartitem[j].productName,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0),
                                              ),
                                              SizedBox(width: 5.0),
                                              cartitem[j].available
                                                  ? cartitem[j].available
                                                      ? Text(
                                                          'x${cartitem[j].quantity}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.0,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      : Container()
                                                  : Container()
                                            ],
                                          ),
                                          SizedBox(height: 7.0),
                                          cartitem[j].available
                                              ? Text(
                                                  'Added to list',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Colors.grey),
                                                )
                                              : OutlineButton(
                                                  onPressed: () {},
                                                  borderSide: BorderSide(
                                                      color: thirdColor,
                                                      width: 1.0,
                                                      style: BorderStyle.solid),
                                                  child: Center(
                                                    child: Text('Find Similar',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.0,
                                                            color: thirdColor)),
                                                  ),
                                                ),
                                          SizedBox(height: 7.0),
                                          cartitem[j].available
                                              ? Text(
                                                  '₹' +
                                                      cartitem[j]
                                                          .price
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                      color: thirdColor),
                                                )
                                              : Container(),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: cartitem.length,
                    )
                  : Center(
                      child: Text('Cart is empty'),
                    ),
            ),
            top: 200,
          ),
          Positioned(
            child: Stack(
              children: [
                Container(
                  width: mediaquery.size.width,
                  height: mediaquery.size.height * 0.1,
                  color: Colors.transparent,
                ),
                Container(
                  width: mediaquery.size.width,
                  height: mediaquery.size.height * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Total : ₹${getTotal()}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 50,
                        width: 180,
                        child: RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.green[600],
                            onPressed: () {},
                            icon: Icon(
                              Icons.credit_card,
                              color: secondaryColor,
                            ),
                            label: Text(
                              'Buy now',
                              style: TextStyle(color: secondaryColor),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
            bottom: 0,
          ),
          Positioned(
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            top: mediaquery.padding.top + 5,
            left: 5,
          ),
        ],
      ),
    ));
  }
}
