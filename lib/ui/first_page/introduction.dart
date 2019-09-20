import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gnu/widgets/animated_button.dart';

class Introduction extends StatefulWidget {
  PageController controller;
  final onTap;

  Introduction({this.controller, this.onTap});

  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  bool isSelected = false;
  bool isStartFirst = false;
  bool isStartSecond = false;
  bool isButtonShow = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        isStartFirst = true;
      });
    });
    Timer(Duration(milliseconds: 950), () {
      setState(() {
        isStartSecond = true;
      });
    });

    Timer(Duration(milliseconds: 1250), () {
      setState(() {
        isButtonShow = true;
      });
    });
  }

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
            Container(
              height: MediaQuery.of(context).size.height * .35,
            ),
            AnimatedOpacity(
              opacity: isStartFirst ? 1 : 0,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 700),
              child: Column(
                children: <Widget>[
                  Text(
                    "سلام،",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Iranyekan"),
                  ),
                  Text(
                    "من iCare هستم",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AnimatedOpacity(
              opacity: isStartSecond ? 1 : 0,
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 800),
              child: Column(
                children: <Widget>[
                  Text(
                    "دستیار شخصی",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "جدید شما",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 900),
              opacity: isButtonShow ? 1 : 0,
              curve: Curves.easeInOut,
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
                  widget.onTap();
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
            Container(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
