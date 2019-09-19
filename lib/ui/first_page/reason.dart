import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReasonPage extends StatelessWidget {
  PageController controller;

  ReasonPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * .75,
              child: Text(
                "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CreateColumn(
                        FontAwesomeIcons.mailBulk, () {}, "کار", controller),
                    CreateColumn(
                        FontAwesomeIcons.home, () {}, "خانواده", controller),
                    CreateColumn(
                        FontAwesomeIcons.heart, () {}, "رابطه", controller),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CreateColumn(
                        FontAwesomeIcons.pen, () {}, "تحصیل", controller),
                    CreateColumn(
                        FontAwesomeIcons.coffee, () {}, "غذا", controller),
                    CreateColumn(FontAwesomeIcons.mailchimp, () {}, "مسافرت",
                        controller),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CreateColumn(
                        FontAwesomeIcons.pen, () {}, "دوست", controller),
                    CreateColumn(
                        FontAwesomeIcons.running, () {}, "ورزش", controller),
                    CreateColumn(
                        FontAwesomeIcons.memory, () {}, "خاطرات", controller),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateColumn extends StatefulWidget {
  IconData icon;
  String title;
  final function;
  PageController controller;

  CreateColumn(this.icon, this.function, this.title, this.controller);

  @override
  _CreateColumnState createState() => _CreateColumnState();
}

class _CreateColumnState extends State<CreateColumn> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
        });
        Timer(Duration(milliseconds: 120), () {
          widget.controller.nextPage(
              duration: Duration(milliseconds: 850), curve: Curves.linear);
        });

        widget.function();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 25),
        curve: Curves.linear,
        height: 90,
        decoration: ShapeDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        width: MediaQuery.of(context).size.width * .29,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.icon,
              size: 25,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title ?? "",
              style: TextStyle(
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
