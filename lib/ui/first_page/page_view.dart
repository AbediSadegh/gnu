import 'package:flutter/material.dart';

import 'enter_name.dart';
import 'introduction.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xff8186e4),Color(0xff7a72c7)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
              ),
            ),
            Container(
              width: double.maxFinite,
              height: double.maxFinite,

              child: WillPopScope(
                onWillPop: (){
                  controller.previousPage(duration: Duration(milliseconds: 250), curve: Curves.linear);
                },
                child: PageView(
//                physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Introduction(controller: controller,),
                    Introduction(controller: controller,),

                  ],
                ),
              ),
            ),

//            Container(width: double.maxFinite,height: double.maxFinite,),
          ],
        ),
      ),
    );
  }
}
