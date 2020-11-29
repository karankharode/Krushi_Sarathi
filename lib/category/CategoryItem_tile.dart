/*
Edited by-Anuj Jain
*/
import 'package:Krushi_Sarathi/values/categoryConfig.dart';
import 'package:flutter/material.dart';
class CategoryItemTile extends StatelessWidget {

  final String imgName;
  final String categoryItemName;
  final Function press;

  CategoryItemTile({@required this.imgName,@required this.categoryItemName,@required  this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        press();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 5),
            width: MediaQuery.of(context).size.width/2,
            height: categoryItemsHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(imgName),
                  fit: BoxFit.fill,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              categoryItemName,
              style: TextStyle(
                fontSize: categoryItemsNameTextSize,
                fontWeight: FontWeight.w700,
                fontFamily:categoryItemsNameFontFamily,
              ),),
          )
        ],
      ),
    );
  }
}
