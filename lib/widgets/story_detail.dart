import 'dart:async';

import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  final String imgSrc;

  StoryDetail({this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class StoryDetailPage extends StatefulWidget {
  final String imgSrc;

  StoryDetailPage({this.imgSrc});

  @override
  _StoryDetailPageState createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 250), () {
      _onButtonPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              widget.imgSrc,
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 45.0,
            ),
          ),
        ),
      ],
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          height: MediaQuery.of(context).size.height * 0.75,
          child: Container(
            child: _buildBottomNavigation(),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return ListView(
//      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و',
          textAlign: TextAlign.center,
        ),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
          textAlign: TextAlign.center,
        ),
        Text(
            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
            textAlign: TextAlign.center),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و',
          textAlign: TextAlign.center,
        ),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
          textAlign: TextAlign.center,
        ),
        Text(
            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
            textAlign: TextAlign.center),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و',
          textAlign: TextAlign.center,
        ),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
          textAlign: TextAlign.center,
        ),
        Text(
            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
            textAlign: TextAlign.center),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و',
          textAlign: TextAlign.center,
        ),
        Text(
          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
          textAlign: TextAlign.center,
        ),
        Text(
            'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده',
            textAlign: TextAlign.center),
        Material(
          shape: StadiumBorder(),
          child: Ink(
            height: 50,
            width: 150,
            decoration: ShapeDecoration(
                shape: StadiumBorder(),
                gradient:
                    LinearGradient(colors: [Colors.green, Colors.greenAccent])),
            child: InkWell(
              splashColor: Colors.grey,
              // highlightColor: Colors.lightGreen,
              customBorder: StadiumBorder(),
              onTap: () {},
              child: Center(child: Text('data')),
            ),
          ),
        )
      ],
    );
  }
}
