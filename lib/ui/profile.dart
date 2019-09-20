import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .2,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  decoration: ShapeDecoration(
                      gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ]),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15)))),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.black12,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 5),
                      child: Text(
                        "مهدی",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Container(),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                createColumn("داستان ها", 3),
                createColumn("امتیازات", 0),
                createColumn("علاقه مندی ها", 0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.smile,size: 55,color: Colors.white,),
                    Text("وضعیت روحی : شاد و خوشحال",style: TextStyle(color: Colors.white),)
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: ShapeDecoration(
                    gradient: LinearGradient(colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor
                    ]),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left :8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.person,size: 55,color: Colors.white,),
                      Text("شاخص بدنی \n 19.5",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * .45,
                height: 150,
                  decoration: ShapeDecoration(
                      gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ]),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.trophy,size: 40,color: Colors.white,),
                      Text("افتخارات",style: TextStyle(color: Colors.white),),
                      Text("5",style: TextStyle(color: Colors.white,fontSize: 18),),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * .45,
                  height: 150,
                  decoration: ShapeDecoration(
                      gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ]),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget createColumn(String text, int number) {
    return Column(
      children: <Widget>[
        Text(
          number.toString(),
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.black38),
        ),
      ],
    );
  }

  Widget creteGradientContainer(context,
      {Widget child, double width, double height}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 100,
        decoration: ShapeDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ]),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
