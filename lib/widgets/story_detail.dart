import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gnu/widgets/home.dart';
import 'package:gnu/widgets/sliding_up_panel/sliding_up_panel.dart';

class StoryDetail extends StatelessWidget {
  final String imgSrc;

  StoryDetail({this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        color: Color(0xffeeeeee),
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        panel: _scrollingList(),
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                this.imgSrc,
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 15.0,
                top: 25.0,
                child: ClipOval(

                  child: Container(
                    height: 43.0,
                    width: 43.0,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: IconButton(
                      color: Colors.black54,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_downward),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scrollingList() {
    return Container(
      //adding a margin to the top leaves an area where the user can swipe
      //to open/close the sliding panel
      margin: const EdgeInsets.only(top: 36.0),

      color: Colors.white,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int i) {
          return DetailCard(
            title: 'تیتر $i',
            content: 'تغییر پایش، اضافه کردن محتوا',
          );
        },
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final String title, content;

  DetailCard({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(color: Colors.black54, fontSize: 18.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(this.content)
        ],
      ),
    );
  }
}
