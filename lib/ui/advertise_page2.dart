import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdvertisePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items0 = [
      createContainer(
        context,
//          color0: Colors.transparent,
//          color1: Colors.black,
        child: Image.asset(
          'asset/photo-4.jpg',
          fit: BoxFit.cover,
          width: 5.0,
          height: 5.0,
          alignment: Alignment.center,
        ),
      ),
      createContainer(
        context,
//          color0: Colors.transparent,
//          color1: Colors.black,
        child: Image.asset(
          'asset/photo-5.jpg',
          fit: BoxFit.cover,
          width: 5.0,
          height: 5.0,
          alignment: Alignment.center,
        ),
      ),
      createContainer(
        context,
//          color0: Colors.transparent,
//          color1: Colors.black,
        child: Image.asset(
          'asset/photo-6.jpg',
          fit: BoxFit.cover,
          width: 5.0,
          height: 5.0,
          alignment: Alignment.center,
        ),
      ),
      createContainer(
        context,
//          color0: Colors.transparent,
//          color1: Colors.black,
        child: Image.asset(
          'asset/photo-7.jpg',
          fit: BoxFit.cover,
          width: 5.0,
          height: 5.0,
          alignment: Alignment.center,
        ),
      ),
      createContainer(
        context,
//          color0: Colors.transparent,
//          color1: Colors.black,
        child: Image.asset(
          'asset/photo-8.jpg',
          fit: BoxFit.cover,
          width: 5.0,
          height: 5.0,
          alignment: Alignment.center,
        ),
      ),
      createContainer(
        context,
//          color0: Colors.transparent,
//          color1: Colors.black,
        child: Image.asset(
          'asset/photo-9.jpg',
          fit: BoxFit.cover,
          width: 5.0,
          height: 5.0,
          alignment: Alignment.center,
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
//            height: 100,
              width: MediaQuery.of(context).size.width * .6,
              child: Text(
                "راهکار های پیشنهادی iCare برای امروز",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  items: items0,
                  aspectRatio: 12 / 8,
                  viewportFraction: .9,
                  reverse: false,
                  initialPage: 1,
//              scrollDirection: Axis.horizontal,
//              children: items0,
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: MediaQuery.of(context).size.width*.4,
                        height: 150,
//                      color: Colors.white,
                        child: Image.asset("asset/photo-9.jpg",fit: BoxFit.cover,),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: MediaQuery.of(context).size.width*.4,
                        height: 150,
                        child: Image.asset("asset/photo-7.jpg",fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
              color: Colors.white,
              child: Container(
                child: Center(
                    child: Icon(Icons.home,color: Theme.of(context).accentColor,size: 45,)),
                height: 50,
                width: MediaQuery.of(context).size.width * .6,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget createContainer(context, {color0, color1, child, content}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ClipRRect(
        child: child,
        borderRadius: BorderRadius.circular(15),
      ),
      decoration: ShapeDecoration(
//        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//          color: Colors.black
//        gradient: LinearGradient(
//          begin: FractionalOffset.topCenter,
//          end: FractionalOffset.bottomCenter,
//          colors: [
//            color0 ?? Theme.of(context).primaryColor,
//            color1 ?? Theme.of(context).accentColor
//          ],
//        ),
      ),
    );
  }
}
