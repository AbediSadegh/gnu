import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnu/widgets/date_picker.dart';
import 'package:intl/intl.dart';

class DatePage extends StatefulWidget {
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
        Text(
          'LOL',
          style: TextStyle(fontSize: 50.0,color: Color(0xffeeeeeedd)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'خیلی خب این داستانت کی اتفاق افتاد',
            ),
            new SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
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
                  this.day = date.day + 1;
                });
              },
              child: Text(
                '${this.month} ${this.day}',
                style: TextStyle(fontSize: 35.0, color: Color(0xffadd7d3)),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
