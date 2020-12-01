import 'package:Krushi_Sarathi/provider/Cartitem.dart';
import 'package:Krushi_Sarathi/Screens/CartPage.dart';
import 'package:Krushi_Sarathi/config.dart';
import 'package:Krushi_Sarathi/provider/products.dart';
import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: drawerColor,
          shadowColor: drawerColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartPage.routename);
                }),
            IconButton(
                icon: Icon(Icons.share, size: 30, color: Colors.white),
                onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: drawerColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80))),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 50, right: 40, left: 40, top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                            image: AssetImage(product.image),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    child: IconButton(
                        icon: (product.isFavorite)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 35,
                              )
                            : Icon(
                                Icons.favorite_border,
                                size: 35,
                              ),
                        onPressed: () {
                          setState(() {
                            product.toogleFavorite(product);
                          });
                        }),
                    bottom: 70,
                    right: 70,
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.productName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${product.price}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'Quantity : ',
                                style: TextStyle(fontSize: 20),
                              ),
                              buildDropdown(context, dropdownValue)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: primaryColor)),
                              icon: Icon(
                                Icons.account_balance_wallet,
                                color: primaryColor,
                                size: 25,
                              ),
                              onPressed: (product.avaliable) ? () {} : null,
                              label: Text(
                                'Buy Now',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              color: Colors.grey[200],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 160,
                            child: RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white)),
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: (product.avaliable)
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
                              label: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Description : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(product.description),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      )
                    ]))
          ]),
        )

        ///

        );
  }

  Widget buildbutton(String mark) {
    return Container(
      width: 70,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.green),
        ),
        child: Text("${mark} kg"),
      ),
    );
  }

  @override
  Widget buildDropdown(BuildContext context, int dropdownValue) {
    final quantity = {1: "10kg", 2: "20kg", 3: "30kg", 4: "50kg"};
    return DropdownButton(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: primaryColor),
      underline: Container(
        height: 2,
        color: primaryColor,
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
            style: TextStyle(fontSize: 15),
          ),
        );
      }).toList(),
    );
  }
}
