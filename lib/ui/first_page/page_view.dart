import 'package:flutter/material.dart';

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
                gradient: LinearGradient(colors: [Theme.of(context).primaryColor, Theme.of(context).accentColor],begin: Alignment.topCenter,end: Alignment.bottomCenter)
              ),
            ),
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              scrollDirection: Axis.vertical,
              children: <Widget>[

              ],
            ),
          ],
        ),
      ),
    );
  }
}
