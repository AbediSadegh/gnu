import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gnu/widgets/animated_button.dart';

class Introduction extends StatefulWidget {
  PageController controller;

  Introduction({this.controller});

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("سلام icare هستم",style: TextStyle(fontSize: 28,color: Colors.white),),
            Text("یک دستیار شخصی",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = true;
                });
              Timer(Duration(milliseconds: 550),(){
                widget.controller.nextPage(duration: Duration(milliseconds: 850), curve: Curves.linear);
              });
              },

              child: AnimatedContainer(
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shadows: [BoxShadow()],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45))),
                height: !isSelected ? 60 : 35,
                width:
                    !isSelected ? MediaQuery.of(context).size.width * .6 : 35,
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
                child: Center(
                  child: AnimatedOpacity(
                    opacity: isSelected ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "ادامه",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    curve: Curves.linear,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
