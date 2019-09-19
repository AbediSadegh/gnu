import 'package:flutter/material.dart';
import 'package:gnu/ui/first_page/page_view.dart';

void main() => runApp(Launcher());

class Launcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff8186e4),
        accentColor: Color(0xff7a72c7),
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xffdfe5ee)),
        ),
        iconTheme: IconThemeData(
          color: Color(0xffdfe5ee),
          size: 55.0
        ),
      ),
      home: FirstPage(),
    );
  }
}
