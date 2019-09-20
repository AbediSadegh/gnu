import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gnu/entities/story.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SavePage extends StatefulWidget {
 PageController controller;

 SavePage(this.controller);

 @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  bool isSelected = false;

  var _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        isSelected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * .08),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width* 0.6,
                      child: Text(
                        "کارت خوب بود،مهدی میخوای یک اسم به امروزت بدی",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(child: Container(),)
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "عنوان",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white.withOpacity(.3))),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              FlatButton(
                onPressed: () {
                  widget.controller.nextPage(duration: Duration(milliseconds: 550), curve: Curves.linear);
                },
                child: Container(
                  height: 55,
                  child: AnimatedOpacity(
                      opacity: isSelected ? 1 : 0,
                      child: Container(
                        child: Center(
                          child: Text(
                            "ذخیره کن",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * .6,
                        height: 55,
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45))),
                      ),
                      duration: Duration(milliseconds: 600)),
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
