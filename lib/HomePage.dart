import 'package:Krushi_Sarathi/HomepageBody.dart';
import 'package:Krushi_Sarathi/drawerScreen.dart';
import 'package:flutter/material.dart';
import 'config.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height*.1,
        shadowColor: primaryColor,
        elevation: 0.0,
        backgroundColor: primaryColor,
        actions: [

          //Search Button

          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/searchicon');
            },
            icon: Icon(EvaIcons.searchOutline),
            iconSize: iconSize,
            color: Colors.white,
          ),

          //Cart Button

          IconButton(
            onPressed: (){
              //Navigator.of(context).pushNamed('/cartpage');
            },
            icon: Icon(EvaIcons.shareOutline),
            iconSize: iconSize,
            color: Colors.white,
          )
        ],
        title: Text(
          "Krishi Sarathi",
          style: TextStyle(
              color: Colors.white,
            fontSize: homepageAppbarTitleSize,
              fontFamily: homepageAppbarTitle,
          ),),
      ),
      drawer: DrawerScreen(context),
      //drawerEdgeDragWidth: MediaQuery.of(context).size.width/2,
      body: HomePageBody(),
    );
  }
}
