import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdvertisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items0 = [
      createContainer(
        context,
//          color0: Colors.transparent,
//          color1: Colors.black,
        child: Image.asset(
          'asset/1000009960.jpg',
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
        child:Image.asset(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: <Widget>[
          SizedBox(height: 120,),
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Container(width: double.maxFinite,),
                  Container(
                      width: MediaQuery.of(context).size.width *.6,
                      child: Text("راهکار های پیشنهادی icare برای امروز",style: TextStyle(fontSize: 20),)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
//                  width: MediaQuery.of(context).size.width * .5,
                    child: CarouselSlider(
                      enlargeCenterPage: false,
                      items: items0,
                      height: MediaQuery.of(context).size.height * .33,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 1.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
//                height: 150,
//                  width: MediaQuery.of(context).size.width * .5,
                    child: CarouselSlider(
                      enlargeCenterPage: false,
                      items: items0,
                      height: MediaQuery.of(context).size.height * .33,
                      autoPlay: false,
                      viewportFraction: 1.0,
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
//                height: 150,
//                      width: MediaQuery.of(context).size.width *.5,
                      child: CarouselSlider(
                        enlargeCenterPage: false,
                        items: items0,
                        height: MediaQuery.of(context).size.height * .33,
                        autoPlay: false,
                        viewportFraction: 1.0,
                        aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
//                height: 150,
//                      width: MediaQuery.of(context).size.width *.5,
                      child: CarouselSlider(
                        enlargeCenterPage: false,
                        items: items0,
                        height: MediaQuery.of(context).size.height * .33,
                        autoPlay: false,
                        viewportFraction: 1.0,
                        aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    color: Colors.white,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 55.0,
                      width: MediaQuery.of(context).size.width *.6,child: Center(child: Text("اتمام",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20),)),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createContainer(context, {color0, color1, child, content}) {
    return Container(
      width: double.maxFinite,
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
