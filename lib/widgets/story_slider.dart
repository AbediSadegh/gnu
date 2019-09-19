import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StorySlider extends StatefulWidget {
  @override
  _StorySliderState createState() => _StorySliderState();
}

class _StorySliderState extends State<StorySlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: <Widget>[
        StoryItem(),
      ],
    );
  }
}

class StoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.red
      ),
    );
  }
}

