import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key}) : super(key: key);

  _CarouselState createState() => _CarouselState();
}

List<IconData> a = [
  Icons.access_alarm,
  Icons.adb,
  Icons.arrow_drop_down_circle,
  Icons.clear
];
List<String> b = [
  'safdsf',
  'fdsdsf',
  'saddf',
  'safdsf',
];

class _CarouselState extends State<Carousel> {
  PageController controller;
  double page = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
      viewportFraction: 0.25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollNotification) {
          setState(() {
            page = controller.page;
          });
        }
        return false;
      },
      child: PageView.builder(

        controller: controller,
        itemCount: a.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Opacity(
                opacity: 1.00 - (page - index).abs() / 3,
                child: Icon(
                  a[index],
                  size: (3.0 - (page - index).abs()) * 20,
                ),
              ),
              Text(
                b[index],
                style: TextStyle(
                    fontSize: 20 + (1.00 - (page - index).abs() * 10)),
              ),
            ],
          );
        },
      ),
    );
  }
}
