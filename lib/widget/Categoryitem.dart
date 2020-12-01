import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final Color backgroundColor;
  final double size;
  final IconData icon;
  final Color iconcolor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  CategoryItem({@required this.backgroundColor, @required this.size, @required this.icon, @required this.margin, @required this.padding, this.iconcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size),
      ),
      padding: padding,
      margin: margin,
      child: Icon(icon, color: iconcolor),
    );
  }
}