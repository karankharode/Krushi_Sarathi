/*
Edited by-Anuj Jain
*/

import 'package:Krushi_Sarathi/category/CategoryItem_data.dart';
import 'package:Krushi_Sarathi/category/CategoryItem_model.dart';
import 'package:Krushi_Sarathi/popularItem/PopularItem_modal.dart';
import 'package:Krushi_Sarathi/popularItem/popularitem_data.dart';
import 'package:Krushi_Sarathi/popularItem/popularitem_tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'category/CategoryItems.dart';
import 'config.dart';
class HomePageBody extends StatefulWidget {

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  List<PopularItemModal> popularitems=new List();
  List<CategoryItemModel> categoriesItems=new List();
  @override
  void initState() {
    popularitems=getPopularItems();
    categoriesItems=getCategoriesItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage(backgroundImage),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.1,
              width: MediaQuery.of(context).size.width,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //home
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/searchicon');
                    },
                    icon: Icon(EvaIcons.home),
                    iconSize: iconSize,
                    color: Colors.white,
                  ),

                  //phone
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/searchicon');
                    },
                    icon: Icon(EvaIcons.phoneCallOutline),
                    iconSize: iconSize,
                    color: Colors.white,
                  ),

                  //cart
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/searchicon');
                    },
                    icon: Icon(EvaIcons.shoppingCart),
                    iconSize: iconSize,
                    color: Colors.white,
                  ),

                  //profile
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed('/searchicon');
                    },
                    icon: Icon(Icons.person_rounded),
                    iconSize: iconSize,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width*.075,),

            //popular items here
            Container(
              height: MediaQuery.of(context).size.width*.3,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: popularitems.length,
                itemBuilder: (context,index){
                  return PopularItemTile(
                    img: popularitems[index].img,
                  );
                },
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width*0.03,),

            //category items here
            CategoryItems(),

            CategoryItems(),
          ],
        ),
      ),
    );
  }
}
