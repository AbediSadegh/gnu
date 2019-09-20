import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gnu/entities/story.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key,this.pageController}) : super(key: key);
  PageController pageController;




  _CarouselState createState() => _CarouselState();
}

List<IconData> a = [
  FontAwesomeIcons.grinHearts,
  FontAwesomeIcons.thumbsUp,
  FontAwesomeIcons.star,
  FontAwesomeIcons.handPeace,
  FontAwesomeIcons.angry,
  Icons.show_chart,
  FontAwesomeIcons.grinBeamSweat,
  FontAwesomeIcons.frown,

//  FontAwesomeIcons.angry,
//  FontAwesomeIcons.frown,
//  FontAwesomeIcons.meh,
//  FontAwesomeIcons.smile,
];
List<String> b = [
  'سرحال',
  'شکر',
  'خوش‌شانس',
  'خوب',
  'عصبانی',
  'گیج',
  'مضطرب',
  'داغون',
];

class _CarouselState extends State<Carousel> {
  PageController controller;
  double page = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
      viewportFraction: 0.25,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "چه حسی داشتی در طول روز؟",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .3,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollNotification) {
                setState(() {
                  page = controller.page;
                });
              }
              return false;
            },
            child: PageView.builder(
              controller: controller,
              itemCount: a.length,
              onPageChanged: (i) {
                Provider.of<Story>(context).emotion = i;
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Opacity(
                      opacity: 1.00 - (page - index).abs() / 3,
                      child: Icon(
                        a[index],
                        size: (3.0 - (page - index).abs()) * 20,
                      ),
                    ),
                    Text(
                      b[index],
                      style: TextStyle(
                          fontSize: 16 + (1.00 - (page - index).abs() * 10)),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
       Expanded(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Container(width: double.maxFinite,),
             FlatButton(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(45))),
               color: Colors.white,
               child: Container(
                   width: MediaQuery.of(context).size.width *0.5,
                   child: Center(child: Text("ادامه",style: TextStyle(color: Theme.of(context).primaryColor),))),
               onPressed: (){
                 widget.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
               },
             ),
           ],
         ),
       ),
      ],
    );
  }
}
