import 'package:flutter/material.dart';
import 'package:gnu/widgets/carousle.dart';

class MyApppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 59),
        child: Carousel(),
      )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: _onButtonPressed,
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.black,
          child: Text('Show'),
          onPressed: () => _onButtonPressed(),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          height: 180,
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

  Column _buildBottomNavigation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
