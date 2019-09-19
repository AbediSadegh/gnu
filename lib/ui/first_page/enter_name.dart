import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  PageController controller;


  NamePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.maxFinite,height: double.maxFinite,),
      backgroundColor: Colors.transparent,
    );
  }
}
