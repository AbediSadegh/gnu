import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gnu/widgets/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 750), () {
      _onButtonPressed();
    });
  }

  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Home();
  }

  void _onButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          height: 350,
          child: Container(
            child: _buildBottomNavigation(),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildBottomNavigation() {
    String str2 = ' من خیلی هیجان زده‌ام برای شروع این ماجرا کنار هم، مهدی';
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 115,
          decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)))),
          width: double.maxFinite,
          child: Center(
            child: SvgPicture.asset(
              "asset/iconfinder-icon.svg",
              height: 70,
              width: 70,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  str2,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'بیا اولین گفتگوی روزانمون رو باهم شروع کنیم!',
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Text('برای ادامه روی "شروع" ضربه بزن',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 10,),
              Expanded(child: Container()),
              Material(
                shape: StadiumBorder(),
                child: Ink(
                  height: 50,
                  width: 150,
                  decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient:
                      LinearGradient(colors: [Theme.of(context).primaryColor, Theme.of(context).accentColor])),
                  child: InkWell(
                    splashColor: Colors.grey,
                    // highlightColor: Colors.lightGreen,
                    customBorder: StadiumBorder(),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(child: Text('شروع',)),
                  ),
                ),
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ],
    );
  }

  String name;

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = await prefs.getString('name') ?? "";
  }
}
