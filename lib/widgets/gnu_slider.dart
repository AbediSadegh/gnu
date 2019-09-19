import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GnuSlider extends StatefulWidget {
  final ValueChanged<int> onChange;

  GnuSlider({this.onChange});

  @override
  _GnuSliderState createState() => _GnuSliderState();
}

class _GnuSliderState extends State<GnuSlider> {
  double _slider = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Visibility(
              visible: _slider.toInt() == 0 ? true : false,
              child: Icon(FontAwesomeIcons.angry),
            ),
            Visibility(
              visible: _slider.toInt() == 1 ? true : false,
              child: Icon(FontAwesomeIcons.frown),
            ),
            Visibility(
              visible: _slider.toInt() == 2 ? true : false,
              child: Icon(FontAwesomeIcons.smile),
            ),
            Visibility(
              visible: _slider.toInt() == 3 ? true : false,
              child: Icon(FontAwesomeIcons.meh),
            ),
          ],
        ),
        SizedBox(
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
            onChangeEnd: (i){
              setState(() {
                _slider = _slider.toInt().toDouble();
              });
            },
//          divisions: 4,
            min: 0,
            max: 3,
            activeColor: Colors.white,
          ),
        )
      ],
    );
  }
}
