import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gnu/ui/first_page/page_view.dart';
import 'package:gnu/ui/home_page.dart';
import 'package:gnu/widgets/home.dart';

void main() => runApp(Launcher());

class Launcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff8186e4),
        accentColor: Color(0xff7a72c7),
        sliderTheme: SliderThemeData(inactiveTrackColor: Color(0xff77777744)),
        fontFamily: "Iranyekan",
        textTheme: TextTheme(
          title: TextStyle(color: Color(0xff7a72c7)),
          body1: TextStyle(
            color: Color(0xffdfe5ee),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xffdfe5ee), size: 55.0),
      ),
      home: FirstPage(),
    );
  }
}
