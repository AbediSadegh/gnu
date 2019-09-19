import 'package:flutter/material.dart';
import 'package:gnu/ui/first_page/page_view.dart';

void main()=> runApp(Launcher());

class Launcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}
