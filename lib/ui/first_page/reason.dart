import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gnu/entities/story.dart';
import 'package:provider/provider.dart';

class ReasonPage extends StatelessWidget {
  PageController controller;
  String mood;

  ReasonPage(this.controller, this.mood);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 105,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * .75,
              child: Text(
                "هووم - چی باعت شده روزت $mood ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
//              height: MediaQuery.of(context).size.height * .55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CreateColumn(FontAwesomeIcons.mailBulk, () {}, "کار",
                          controller, 0),
                      CreateColumn(FontAwesomeIcons.home, () {}, "خانواده",
                          controller, 1),
                      CreateColumn(
                        FontAwesomeIcons.plus,
                        () {},
                        "سایر",
                        controller,
                        2,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CreateColumn(
                          FontAwesomeIcons.pen, () {}, "تحصیل", controller, 3),
                      CreateColumn(
                          FontAwesomeIcons.coffee, () {}, "غذا", controller, 4),
                      CreateColumn(FontAwesomeIcons.mailchimp, () {}, "مسافرت",
                          controller, 5),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CreateColumn(
                          Icons.person, () {}, "دوستان", controller, 6),
                      CreateColumn(FontAwesomeIcons.heart, () {}, "رابطه ",
                          controller, 7),
                      CreateColumn(FontAwesomeIcons.memory, () {}, "فعالیت ها",
                          controller, 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(45))),
                color: Colors.white,
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 55.0,
                    child: Center(
                        child: Text(
                      "ادامه",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ))),
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
              ),
            ],
          ),
          SizedBox(
            height: 55,
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
  Color color;
  int number;
  PageController controller;

  CreateColumn(
      this.icon, this.function, this.title, this.controller, this.number,
      {this.color});

  @override
  _CreateColumnState createState() => _CreateColumnState();
}

class _CreateColumnState extends State<CreateColumn> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color color;
    returnColor() {
//      isSelected ? Theme.of(context).primaryColor : Colors.white
      if (isSelected) {
        color = Theme.of(context).primaryColor;
      } else if (widget.color != null) {
        color = widget.color;
      } else
        color = Colors.white;
    }

    returnColor();

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          setState(() {
            isSelected = false;
//          Provider.of<Story>(context).category = widget.number;
          });
        } else {
          setState(() {
            isSelected = true;
//          Provider.of<Story>(context).category = widget.number;
          });
        }

//        Timer(Duration(milliseconds: 120), () {
//          widget.controller.nextPage(
//              duration: Duration(milliseconds: 850), curve: Curves.linear);
//        });

        widget.function();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 25),
        curve: Curves.linear,
        height: 90,
        decoration: ShapeDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        width: MediaQuery.of(context).size.width * .29,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.icon,
              size: 25,
              color: color,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.title ?? "",
              style: TextStyle(color: color, fontFamily: "Iranyekan"),
            ),
          ],
        ),
      ),
    );
  }
}
