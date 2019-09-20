import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gnu/ui/first_page/page_view.dart';
import 'package:gnu/ui/question.dart';

import 'package:fl_chart/fl_chart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int _page = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
        bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).primaryColor,
          backgroundColor: Colors.transparent,height: 55,
          items: <Widget>[
            Icon(Icons.home,size: 36,),
            Icon(Icons.show_chart,size: 36,),
            Icon(Icons.person,size: 36,)
          ],
          onTap: (i) {
            setState(() {
              _page = i;
            });
          },
        ),
        body: (_page == 0)
            ? Container(
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
                      Text('شروع پایش جدید',style: TextStyle(color: Colors.white),
                    ),
                  ],
                  ),color: Theme.of(context).primaryColor,
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
        ))
      : (_page == 1)
                ? Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [LineChartSample2(), LineChartSample2()],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                    ))
                : Container(),
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

class LineChartSample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ];
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: Color(0xff232d37)),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 18.0, left: 12.0, top: 24, bottom: 12),
          child: FlChart(
            chart: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawHorizontalGrid: true,
                  getDrawingVerticalGridLine: (value) {
                    return const FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingHorizontalGridLine: (value) {
                    return const FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    textStyle: TextStyle(
                        color: const Color(0xff68737d),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    getTitles: (value) {
                      return value.toStringAsFixed(0);
                    },
                    margin: 8,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    textStyle: TextStyle(
                      color: const Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 1:
                          return '10k';
                        case 3:
                          return '30k';
                        case 5:
                          return '50k';
                      }
                      return '';
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Color(0xff37434d), width: 1)),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 3.1),
                      FlSpot(8, 4),
                      FlSpot(9.5, 3),
                      FlSpot(11, 4),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BelowBarData(
                      show: true,
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.3))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
