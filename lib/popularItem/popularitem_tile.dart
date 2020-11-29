/*
Edited by-Anuj Jain
*/

import 'package:flutter/material.dart';
class PopularItemTile extends StatelessWidget {

  final String img;

  PopularItemTile({@required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.5,
      margin: EdgeInsets.only(right: 10),
      child: ClipRRect(
        child: Image.asset(
          img,
          fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width*.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
