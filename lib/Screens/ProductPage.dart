import 'package:Krushi_Sarathi/provider/Cartitem.dart';
import 'package:Krushi_Sarathi/Screens/CartPage.dart';
import 'package:Krushi_Sarathi/config.dart';
import 'package:Krushi_Sarathi/provider/products.dart';
import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPage extends StatefulWidget {
  static const routename = '/productpage';

  //final Product product;

  //ProductPage({@required this.product});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var dropdownValue = 1;
  bool _init = true;
  var products;
  var product;

  @override
  void didChangeDependencies() {
    if (_init) {
      final id = ModalRoute.of(context).settings.arguments as String;
      product =
          Provider.of<Products>(context, listen: false).findElementById(id);
      print(product);
      // product = products.;
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartitem>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CartPage.routename);
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            width: width * 0.06,
          )
        ],
      ),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "Assets/background.png",
              ),
              fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Container(
                  padding: EdgeInsets.only(top: height * 0.05),
                  height: height * 0.5,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: containerBackgroundColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // product image section
                      Container(
                        height: height * 0.25,
                        width: width * 0.9,
                        margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
                        child: Center(
                          child: ClipOval(
                            child: Image(
                              image: AssetImage(product.image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      //red favorite(heart) section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: width * 0.6,
                          ),
                          IconButton(
                              icon: (product.isFavorite)
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                    ),
                              onPressed: () {
                                setState(() {
                                  product.toogleFavorite(product);
                                });
                              }),
                        ],
                      ),
                      // product name section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            product.productName,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'RedRose-Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                        ],
                      ),
                      //Star rating section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: width * 0.5,
                          ),
                          RatingBar(
                            ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 5,
                              ),
                              half: null,
                              empty: Icon(
                                Icons.star_border,
                                color: Colors.black87,
                                size: 5,
                              ),
                            ),
                            initialRating: 4.5,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            onRatingUpdate: (rating) {
                              rating = rating;
                            },
                            itemSize: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              // price and quantity section
              Container(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // product price section
                    Text(
                      "₹ ${product.price}",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Cinzel',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    // Product quantity section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Quantity : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto-Medium',
                          ),
                        ),
                        Container(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: quantityColor,
                            ),
                            padding: EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [buildDropdown(context, dropdownValue)],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              // buy and add to cart section
              Container(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Buy Now button
                    InkWell(
                      onTap: (product.avaliable) ? () {} : null,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Icon(
                                Icons.arrow_right_alt,
                                color: Colors.black,
                              ),
                              padding: EdgeInsets.only(right: 2.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Buy Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quattrocento-Bold',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    // Add to Cart button
                    InkWell(
                      onTap: (product.avaliable)
                          ? () {
                              cart.addItem(
                                  id: product.id,
                                  avail: product.avaliable,
                                  image: product.image,
                                  price: 100,
                                  productname: product.productName,
                                  quantity: 2);
                            }
                          : null,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7.0)),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quattrocento-Bold',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              // description section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Container(
                  padding: EdgeInsets.only(top: height * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Ramabhadra-Regular',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Ramabhadra-Regular',
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildbutton(String mark) {
    return Container(
      child: Text(
        "${mark}",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto-Thin',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget buildDropdown(BuildContext context, int dropdownValue) {
    final quantity = {1: "10kg", 2: "20kg", 3: "30kg", 4: "50kg"};
    return DropdownButton(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto-Thin',
        fontWeight: FontWeight.bold,
      ),
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: [1, 2, 3, 4].map<DropdownMenuItem>((var value) {
        return DropdownMenuItem(
          value: value,
          child: Text(
            quantity[value],
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'Roboto-Thin',
            ),
          ),
        );
      }).toList(),
    );
  }
}
