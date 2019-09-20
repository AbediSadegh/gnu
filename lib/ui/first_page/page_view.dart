import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gnu/ui/first_page/reason.dart';
import 'package:gnu/widgets/carousle.dart';
import 'package:gnu/widgets/date_page.dart';
import 'package:gnu/widgets/gnu_slider.dart';

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
  bool isFirstPage = true;
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
        onTap: (){
          setState(() {
            isFirstPage = false;});
        },
      ),
//      ReasonPage(controller),
      NamePage(controller:controller),
    ];
    return Hero(
      tag: 'home',
      child: Directionality(
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
                padding: const EdgeInsets.only(top:18.0,left: 0),
                child: AnimatedContainer(
                  padding: EdgeInsets.only(left: isFirstPage ? 0 : 15,top: 12),
                  height: MediaQuery.of(context).size.height*.3,
                  duration: Duration(milliseconds: 900),
                  child: SvgPicture.asset("asset/iconfinder-icon.svg",width: 85,height: 85,),
                  alignment:isFirstPage ?  Alignment.bottomCenter : Alignment.topLeft,
                  curve: Curves.linear,
                ),
              ),
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: WillPopScope(
                  onWillPop: () {
                    controller.previousPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear);
                    if(controller.page == 1.0){
                      setState(() {
                        isFirstPage =true;
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
//                    Container(
//                      alignment: Alignment.bottomRight,
//                      height: double.maxFinite,
//                      width: double.maxFinite,
//                      child: Padding(
//                        padding: const EdgeInsets.all(12.0),
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.end,
//                          children: <Widget>[
//                            GestureDetector(
//                                onTap: () {
//                                  if (controller.page > 0)
//                                    controller.previousPage(
//                                        duration: Duration(milliseconds: 950),
//                                        curve: Curves.linear);
//                                },
//                                child: Icon(
//                                  Icons.keyboard_arrow_up,
//                                  size: 42,
//                                )),
//                            GestureDetector(
//                              onTap: () {
//                                if (controller.page < list.length)
//                                  controller.nextPage(
//                                      duration: Duration(milliseconds: 950),
//                                      curve: Curves.linear);
//                              },
//                              child: Icon(
//                                Icons.keyboard_arrow_down,
//                                size: 42,
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
