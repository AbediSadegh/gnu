import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  PageController controller;

  NamePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 85,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Text(
                    "خوش حال شدم از آشناییت. اسمت رو وارد کن",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.start,
                  )),
            ),
            SizedBox(
              height: 45,
            ),
            SizedBox(

              width: MediaQuery.of(context).size.width*.5,
              child: TextField(
                decoration: InputDecoration(
                    hoverColor: Colors.amber,
                    focusColor: Colors.amber,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
