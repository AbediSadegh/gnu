import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  final onTap;
  final String text;
  final function;
  AnimationContainer({this.onTap, this.text,this.function});

  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected = true;
        });
        widget.function();
      },
      child: AnimatedContainer(
        decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        height: !isSelected ? 25 : 15,
        width: !isSelected ? 150 : 15,
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
        child: Center(
          child: AnimatedOpacity(
            opacity: isSelected ? 0.0 : 1.0,
            duration: Duration(milliseconds: 150),
            child: Text(widget.text,style: TextStyle(fontSize: 20,color: Colors.black),),
            curve: Curves.linear,
          ),
        ),
      ),
    );
  }
}
