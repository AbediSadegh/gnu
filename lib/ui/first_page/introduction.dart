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
            Text(
              "سلام icare هستم",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              "یک دستیار شخصی",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = true;
                });
                Timer(Duration(milliseconds: 550), () {
                  widget.controller.nextPage(
                      duration: Duration(milliseconds: 850),
                      curve: Curves.linear);
                });
              },
              child: RaisedButton(
                focusColor: Colors.white,
                splashColor: Colors.white,
                color: Colors.white,
                hoverColor: Colors.white,
                highlightColor: Colors.white,
                disabledColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45)),
                onPressed: () {
                  widget.controller.nextPage(
                      duration: Duration(milliseconds: 550),
                      curve: Curves.linear);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    width: MediaQuery.of(context).size.width * .6,
                    height: 55,
                    child: Center(
                      child: Text(
                        "سلام",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                    ),
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
