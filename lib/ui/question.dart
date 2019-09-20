import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gnu/entities/story.dart';
import 'package:gnu/ui/first_page/reason.dart';
import 'package:gnu/ui/save_page.dart';
import 'package:gnu/widgets/carousle.dart';
import 'package:gnu/widgets/date_page.dart';
import 'package:gnu/widgets/gnu_slider.dart';
import 'package:provider/provider.dart';

import 'advertise_page.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  PageController controller;
  bool isFirstPage = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  String mood = "تقریبا خوب بوده باشه";

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      DatePage(
        onTap: () {
          controller.nextPage(
              duration: Duration(milliseconds: 550), curve: Curves.linear);
          setState(() {
            isFirstPage = false;
          });
        },
      ),
      GnuSlider(
        onTap: () {
          controller.nextPage(
              duration: Duration(milliseconds: 550), curve: Curves.linear);
        },
      ),
      ReasonPage(controller, mood),
      Carousel(
        pageController: controller,
      ),
      SavePage(controller),
      AdvertisePage(),
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
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 0),
              child: AnimatedContainer(
                padding: EdgeInsets.only(left: isFirstPage ? 0 : 15, top: 12),
                height: MediaQuery.of(context).size.height * .3,
                duration: Duration(milliseconds: 900),
                child: SvgPicture.asset(
                  "asset/iconfinder-icon.svg",
                  width: 85,
                  height: 85,
                ),
                alignment:
                    isFirstPage ? Alignment.bottomCenter : Alignment.topLeft,
                curve: Curves.linear,
              ),
            ),
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: WillPopScope(
                onWillPop: () {
                  if (controller.page == 0.0) {
                    Navigator.pop(context);
                  } else
                    controller.previousPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear);
                  if (controller.page == 1.0) {
                    setState(() {
                      isFirstPage = true;
                    });
                  }
                },
                child: Stack(
                  children: <Widget>[
                    PageView(
                      physics: NeverScrollableScrollPhysics(),
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
                            IconButton(
                                onPressed: () {
                                  if (controller.page > 0)
                                    controller.previousPage(
                                        duration: Duration(milliseconds: 950),
                                        curve: Curves.linear);
                                  if (controller.page - 1 == 0.0) {
                                    setState(() {
                                      isFirstPage = true;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 42,
                                )),
                            IconButton(
                              onPressed: () {
                                if (controller.page < list.length) {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 950),
                                      curve: Curves.linear);
                                }
                                if (controller.page + 1 == 1.0) {
                                  setState(() {
                                    isFirstPage = false;
                                  });
                                }
                              },
                              icon: Icon(
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
