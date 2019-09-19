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
      onTap: (){},
      child: AnimatedContainer(
        decoration: ShapeDecoration(
            color: Colors.white,
            shadows: [
              BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  spreadRadius: .2,
                  offset: Offset(0, 5),
                  blurRadius: 2.5)
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45))),
        height: !isSelected ? 60 : 45,
        width:
        !isSelected ? MediaQuery.of(context).size.width * .6 : MediaQuery.of(context).size.width *.4,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
        child: Center(
          child: AnimatedOpacity(
            opacity: isSelected ? 0.0 : 1.0,
            duration: Duration(milliseconds: 500),
            child: Text(
              "ادامه",
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
            curve: Curves.linear,
          ),
        ),
      ),
    );
  }
}
