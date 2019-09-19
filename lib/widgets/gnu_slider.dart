import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GnuSlider extends StatefulWidget {
  final ValueChanged<int> onChange;

  GnuSlider({this.onChange});

  @override
  _GnuSliderState createState() => _GnuSliderState();
}

class _GnuSliderState extends State<GnuSlider> {
  double _slider = 2;

  List<String> moods = [
    'خیلی بد',
    'ناراحت کننده',
    'فوق العاده',
    'عجیب بود',
  ];
  List<IconData> icons = [
    FontAwesomeIcons.angry,
    FontAwesomeIcons.frown,
    FontAwesomeIcons.smile,
    FontAwesomeIcons.meh
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 85,),
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 15,),
  Container(width: 0,), Text(
              'روزت چطور بود؟',
              style: TextStyle(fontSize: 25.0),
            ),
          ],
        ),
        new SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        new Icon(icons[_slider.toInt()]),
        new SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
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
              });
            },
//          divisions: 4,
            min: 0,
            max: 3,
            activeColor: Colors.white,
          ),
        ),
        Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex:4,
                child: Container(
                  alignment: Alignment.center,
                  child: new Text('روزت رو بسنج'),
//                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
              Expanded(
                flex:3,
                child: new Text(moods[_slider.toInt()]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
