import 'package:flutter/material.dart';

class AnimatedContainer extends StatefulWidget {
  AnimationController animationController;

  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainer> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> width;
  Animation<double> height;
  Animation<double> fontSize;


  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    width = Tween<double>(
      begin: 120,
      end: 0,
    ).animate(
      _controller
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
