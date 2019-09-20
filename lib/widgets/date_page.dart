import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnu/entities/story.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class DatePage extends StatefulWidget {
  final onTap;

  DatePage({this.onTap});

  @override
  _DatePageState createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  final format = DateFormat("yyyy-MM-dd");
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'Octobor',
    'November',
    'December',
  ];
  String month;

  int day;

  @override
  void initState() {
    super.initState();
    this.month = months[DateTime.now().month - 1];
    this.day = DateTime.now().day;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .35,
            ),
            new Text(
              'بسیار خب ${Provider.of<Name>(context).name}بیا شروع\n کنیم پایش جدید رو!',
              style: TextStyle(fontSize: 18),
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Text(
                  "انتخاب زمان",
                  style: TextStyle(
                      fontSize: 65,
                      color: Colors.white.withOpacity(.2),
                      fontFamily: "Iranyekan"),
                ),
                FlatButton(
                  onPressed: () {
                    Future<DateTime> time = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2070));
                    time.then((date) {
                      this.month = months[date.month];
                      this.day = date.day;
                      Provider.of<Story>(context).day = date.day;
                      Provider.of<Story>(context).month = date.month;
                    });
                  },
                  child: Text(
                    '${this.month} ${this.day}',
                    style: TextStyle(fontSize: 35.0, color: Colors.white),
                  ),
                ),
              ],
            ),
            Text("امروز"),
            Expanded(
              child: Container(),
            ),
            RaisedButton(
              padding: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
              onPressed: widget.onTap,
              child: Container(
                height: 55,
                child: Container(
                  child: Center(
                    child: Text(
                      "ادامه دادن",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .6,
                  height: 55,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45))),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ]),
    );
  }
}
