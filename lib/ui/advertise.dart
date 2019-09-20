import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdvertisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> items0 = [
      createContainer(context,
          child: Image(
            image: AssetImage("asset/photo-1.jpg"),
            fit: BoxFit.cover,
          )),
      createContainer(context,
          child: Image(
            image: AssetImage("asset/photo-2.jpg"),
            fit: BoxFit.cover,
          )),
      createContainer(context,
          child: Image(
            image: AssetImage("asset/photo-3.jpg"),
            fit: BoxFit.cover,
          )),
    ];
    List<Widget> items1;
    List<Widget> items2;
    List<Widget> items3;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
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
                SizedBox(width: 5,),
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
            SizedBox(height: 5,),
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
                  SizedBox(height: MediaQuery.of(context).size.height*.2,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createContainer(context, {color0, color1, child}) {
    return Container(
      width: double.maxFinite,
      child: ClipRRect(child: child,borderRadius: BorderRadius.circular(15),),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          gradient: LinearGradient(colors: [
            color0 ?? Theme.of(context).primaryColor,
            color1 ?? Theme.of(context).accentColor
          ])),
    );
  }
}
