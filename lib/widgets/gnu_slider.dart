import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gnu/entities/story.dart';
import 'package:gnu/ui/home_page.dart';
import 'package:provider/provider.dart';

class GnuSlider extends StatefulWidget {
  final ValueChanged<int> onChange;
  final onTap;

  GnuSlider({this.onChange, this.onTap});

  @override
  _GnuSliderState createState() => _GnuSliderState();
}

class _GnuSliderState extends State<GnuSlider> {
  double _slider = 2;

  List<String> moods = [
    'خیلی بد بود',
    'تقریبا بد بود',
    'خوب تقریبا',
    'خیلی خوب بود',
  ];
  List<IconData> icons = [
    FontAwesomeIcons.angry,
    FontAwesomeIcons.frown,
    FontAwesomeIcons.meh,
    FontAwesomeIcons.smile,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 85,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            Container(
              width: 0,
            ),
            Text(
              'روزت چطور بود؟',
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
        new SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        new Icon(icons[_slider.toInt()]),
        Directionality(
          textDirection: TextDirection.ltr,
          child: new SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Slider(
              value: _slider.toDouble(),
              onChanged: (r) {
                if (widget.onChange != null) widget.onChange(r.toInt());
                setState(() {
                  _slider = r;
                  print(_slider);
                });
              },
              onChangeEnd: (i) {
                setState(() {
                  _slider = _slider.toInt().toDouble();
                  Provider.of<Story>(context).rate = _slider.toInt();
                });
              },
//          divisions: 4,
              min: 0,
              max: 3,
              activeColor: Colors.white,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: new Text('روزت رو بسنج'),
//                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                new Text(moods[_slider.toInt()]),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: 55,
            child: Opacity(
              opacity: 1,
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
//                duration: Duration(milliseconds: 600)
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
