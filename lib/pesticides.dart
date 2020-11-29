import 'package:flutter/material.dart';
class Pesticides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Pesticides"),
      ),
      body: Center(
        child:LinearProgressIndicator(
          backgroundColor: Colors.white,
          minHeight: 20,
        ),
      ),
    );
  }
}
