import 'package:Krushi_Sarathi/provider/Cartitem.dart';
import 'package:Krushi_Sarathi/Screens/ProductPage.dart';
import 'package:Krushi_Sarathi/config.dart';
import 'package:Krushi_Sarathi/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final String id;

  ProductItem(this.id);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  //bool _isFav = false;
  @override
  Widget build(BuildContext context) {
    //final mediaquery = MediaQuery.of(context);
    final products = Provider.of<Products>(context, listen: false).items;
    final cart = Provider.of<Cartitem>(context, listen: false);

    final product = products.firstWhere((element) => element.id == widget.id);

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
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
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
                '₹${product.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.productName,
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
                  color: (product.avaliable) ? Colors.white : Colors.grey,
                ),
                onPressed: (!product.avaliable)
                    ? null
                    : () {
                        cart.addItem(
                            id: product.id,
                            productname: product.productName,
                            avail: product.avaliable,
                            image: product.image,
                            price: 100,
                            quantity: 2);
                      },
                label: Text(
                  'Add',
                  style: TextStyle(
                      color: (product.avaliable) ? Colors.white : Colors.grey),
                ),
                color: (product.avaliable) ? drawerColor : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
