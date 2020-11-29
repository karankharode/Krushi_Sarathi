import 'config.dart';
import 'package:flutter/material.dart';
import 'package:Krushi_Sarathi/values/drawerConfig.dart';

  Widget DrawerScreen(BuildContext context) {

    double drawerWidth=MediaQuery.of(context).size.width/1.5;


    return Container(
      width: drawerWidth,
      decoration: BoxDecoration(
        color: drawerColor,
      ),
      padding: EdgeInsets.only( left: 0,top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // profile tile
          Container(
            color: drawerProfileColor,
            height: drawerWidth/3.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('Assets/profile_user.png'),
                    radius: avatarIconSize,
                  ),
                ),
                SizedBox(width: 20,),
                Text(
                  'Hello KK4',
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily:textFontFamily,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          //home
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.home_filled,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'Home',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w300,
                    fontFamily: textFontFamily,
                    fontSize: drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.0),

          //Categories
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('/categoryItems');
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.apps_rounded,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'Categories',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w300,
                    fontFamily: textFontFamily,
                    fontSize: drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.0),

          // Featured Products
          InkWell(
            onTap: (){
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.business_center_rounded,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'Featured Products',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: textFontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize:drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0),

          //Divider
          Divider(thickness: 1, color: dividerColor,height: 10,),

          SizedBox(height: 10.0),

          //Account
          InkWell(
            onTap: (){
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.accessibility_new_rounded,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'Account',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: textFontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize:drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.0),

          //WishList
          InkWell(
            onTap: (){
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.toll_rounded,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'WishList',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: textFontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize:drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.0),

          //Orders
          InkWell(
            onTap: (){
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.work,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'Orders',
                  style: TextStyle(
                    fontFamily: textFontFamily,
                    color: textColor,
                    fontWeight: FontWeight.w300,
                    fontSize:drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.0),

          //Sign Out
          InkWell(
            onTap: (){
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.logout,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'SignOut',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: textFontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize:drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0),

          //Divider
          Divider(thickness: 1, color:dividerColor,height: 10,),

          SizedBox(height: 10.0),

          //Settings
          InkWell(
            onTap: (){
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.settings,color:iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: textFontFamily,
                    color: textColor,
                    fontWeight: FontWeight.w300,
                    fontSize:drawertextSize,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15.0),

          //Help
          InkWell(
            onTap: (){
            },
            child: Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.announcement_outlined,color: iconColor,size: iconSize,),
                SizedBox(width: 10,),
                Text(
                  'Help',
                  style: TextStyle(
                    color: textColor,
                    fontFamily:textFontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize:drawertextSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

