import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReasonPage extends StatelessWidget {
  PageController controller;

  ReasonPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Container(
              width: MediaQuery.of(context).size.width*.75,
              child: Text(
                  "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(height: 35,),
          Container(
            height: MediaQuery.of(context).size.height * .45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    createColumn(FontAwesomeIcons.mailBulk, () {}, "کار"),
                    createColumn(FontAwesomeIcons.home, () {}, "خانواده"),
                    createColumn(FontAwesomeIcons.heart, () {}, "رابطه"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    createColumn(FontAwesomeIcons.pen, () {}, "تحصیل"),
                    createColumn(FontAwesomeIcons.coffee, () {}, "غذا"),
                    createColumn(FontAwesomeIcons.mailchimp, () {}, "مسافرت"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    createColumn(FontAwesomeIcons.pen, () {}, "دوست"),
                    createColumn(FontAwesomeIcons.running, () {}, "ورزش"),
                    createColumn(FontAwesomeIcons.memory, () {}, "خاطرات"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createColumn(IconData icon, final onTap, String text) {
    return GestureDetector(
      onTap: () {
        controller.nextPage(
            duration: Duration(milliseconds: 850), curve: Curves.linear);
        onTap();
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 25,
            ),
            SizedBox(height: 5,),
            Text(text ?? ""),
          ],
        ),
      ),
    );
  }
}
