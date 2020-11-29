/*
Edited by-Anuj Jain
*/


import 'package:Krushi_Sarathi/values/categoryConfig.dart';
import 'package:flutter/material.dart';
import 'CategoryItem_data.dart';
import 'CategoryItem_model.dart';
import 'CategoryItem_tile.dart';

class CategoryItems extends StatefulWidget {
  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {

  List<CategoryItemModel> categoriesItems=new List();
  @override
  void initState() {
    categoriesItems=getCategoriesItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 20,bottom: 0),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontFamily: categoryTitlefamily,
                  decoration:TextDecoration.underline,
                  fontSize: categoryTileTextSize,
                  fontWeight: FontWeight.w700,
                  //color: Colors.white
                ),
              ),
            ),
            GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: categoriesItems.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width*.5,
                  crossAxisSpacing: MediaQuery.of(context).size.width*.03,
                ),
                itemBuilder: (context, index){
                  return CategoryItemTile(
                    categoryItemName: categoriesItems[index].categoryItemName,
                    imgName: categoriesItems[index].imgName,
                    press:(){
                      Navigator.pushNamed(context, '/${categoriesItems[index].categoryItemName}');
                    },
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
