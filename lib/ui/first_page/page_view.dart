import 'package:flutter/material.dart';
import 'package:gnu/ui/first_page/reason.dart';

import 'enter_name.dart';
import 'introduction.dart';
//import 'package:gnu/widgets/gnu_carousel_slider.dart';
//import 'package:gnu/widgets/gnu_slider.dart';
import 'package:gnu/widgets/story_slider.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Introduction(
        controller: controller,
      ),
      NamePage(controller),
      StorySlider(),
      ReasonPage(controller),

    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: WillPopScope(
                onWillPop: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.linear);
                },
                child: Stack(
                  children: <Widget>[
                    PageView(
//                physics: NeverScrollableScrollPhysics(),
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      children: list,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  if (controller.page > 0)
                                    controller.previousPage(
                                        duration: Duration(milliseconds: 950),
                                        curve: Curves.linear);
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 42,
                                )),
                            GestureDetector(
                              onTap: () {
                                if (controller.page < list.length)
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 950),
                                      curve: Curves.linear);
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 42,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
