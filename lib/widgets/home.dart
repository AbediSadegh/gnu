import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gnu/ui/first_page/page_view.dart';
import 'package:gnu/ui/question.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: CarouselSlider(
              enlargeCenterPage: true,
              aspectRatio: 0.9,
              reverse: false,
              initialPage: 0,
              enableInfiniteScroll: false,
              items: <Widget>[
                HomeCard(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                      return QuestionPage();
                    }));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add, color: Colors.white,size: 35,),
                          SizedBox(
                            height: 5.0,
                          ),
                          Icon(Icons.edit,color: Colors.white,),
                        ],
                      ),

                      SizedBox(
                        height: 5.0,
                      ),
                      Text('شروع پایش جدید',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                HomeCard(
                  onPressed: () {},
                ),
                HomeCard(
                  onPressed: () {},
                ),
                HomeCard(
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  HomeCard({this.child, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: this.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: FlatButton(
        onPressed: this.onPressed,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.85,
          child: this.child != null ? this.child : Container(),
        ),
      ),
      elevation: 4.0,
      borderOnForeground: true,
    );
  }
}
