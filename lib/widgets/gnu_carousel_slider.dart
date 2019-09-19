import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GnuCarouselSlider extends StatefulWidget {
  final ValueChanged<int> onChange;

  GnuCarouselSlider({this.onChange});

  @override
  _GnuCarouselSliderState createState() => _GnuCarouselSliderState();
}

class _GnuCarouselSliderState extends State<GnuCarouselSlider> {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      onPageChanged: (r) {
        if (widget.onChange != null) widget.onChange(r.toInt());
      },
      aspectRatio: 2.0,
      viewportFraction: 0.3,
      enableInfiniteScroll: false,
      enlargeCenterPage: true,
      items: <_CarouselItem>[
        _CarouselItem(
          title: 'Item 0',
          icon: FontAwesomeIcons.angry,
        ),
        _CarouselItem(
          title: 'Item 1',
          icon: FontAwesomeIcons.meh,
        ),
        _CarouselItem(
          title: 'Item 2',
          icon: FontAwesomeIcons.smile,
        ),
        _CarouselItem(
          title: 'Item 3',
          icon: FontAwesomeIcons.frown,
        ),
      ],
    );
  }
}

class _CarouselItem extends StatelessWidget {
  final String title;
  final IconData icon;

  _CarouselItem({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(this.icon, size: 65.0,),
        SizedBox(
          height: 10.0,
        ),
        Text(this.title),
      ],
    );
  }
}
