import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

class NamePage extends StatefulWidget {
  PageController controller;

  NamePage({this.controller});

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  bool isSelected = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        isSelected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 105,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "از آشناییت خوشحالم،",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "میتونی بهم بگی دوستات چی صدات میکنن؟",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: TextField(
                      controller: textEditingController,
                      onSubmitted: (String text) {
                        //todo ذخیره در sharePrefrences
                        print(text);
                        _saveName(text);
                      },
//                    autofocus: true,
                      cursorColor: Colors.white,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "IranYekan"),
                      decoration: InputDecoration(
                        hintText: "نام مستعار",
                        hintStyle: TextStyle(fontSize: 25, color: Colors.white.withOpacity(.5)),
//                      enabledBorder: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white.withOpacity(.3))),
//                      focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: 0,),
                  FlatButton(
                    onPressed: (){
                      _saveName(textEditingController.text);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
//                  widget.controller.nextPage(duration: Duration(milliseconds: 550), curve: Curves.linear);
                    },
                    child: Container(
                      height: 55,
                      child: AnimatedOpacity(
                          opacity: isSelected ? 1 : 0,
                          child: Container(
                            child: Center(
                              child: Text(
                                "ادامه دادن",
                                style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),
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
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.1,)
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  _saveName(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", text);
  }
}
