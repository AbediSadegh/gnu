import 'dart:async';
import 'dart:ui' as prefix0;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gnu/ui/question.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:gnu/widgets/story_detail.dart';

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
        backgroundColor: Colors.transparent,
        height: 55,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 36,
          ),
          Icon(
            Icons.show_chart,
            size: 36,
          ),
          Icon(
            Icons.person,
            size: 36,
          )
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
                      date: null,
                      moodIcon: null,
                      onPressed: () {
                        Navigator.of(context)
                            .push(ScaleRoute(page: QuestionPage()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 35,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'شروع پایش جدید',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    HomeCard(
                      date: '1398/11/5',
                      moodIcon: FontAwesomeIcons.angry,
                      onPressed: () {
                        Navigator.of(context).push(ScaleRoute(
                            page: StoryDetail(
                          imgSrc: 'asset/photo-1.jpg',
                        )));
                      },
                      child: Container(
                        child: Image.asset(
                          'asset/photo-1.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    HomeCard(
                      date: '1398/12/3',
                      moodIcon: FontAwesomeIcons.smile,
                      onPressed: () {
                        Navigator.of(context).push(ScaleRoute(
                            page: StoryDetail(
                          imgSrc: 'asset/photo-2.jpg',
                        )));
                      },
                      child: Container(
                        child: Image.asset(
                          'asset/photo-2.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    HomeCard(
                      date: '1398/12/5',
                      moodIcon: FontAwesomeIcons.frown,
                      onPressed: () {
                        Navigator.of(context).push(ScaleRoute(
                            page: StoryDetail(
                          imgSrc: 'asset/photo-3.jpg',
                        )));
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        child: Image.asset(
                          'asset/photo-3.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          : (_page == 1)
              ? Padding(
                  padding: EdgeInsets.all(6),
                  child: ListView(
                    children: [
                      LineChartSample2(),
                      SizedBox(
                        height: 10,
                      ),
                      PieChartSample2(),
                      SizedBox(
                        height: 10,
                      ),
                      BarChartSample1()
                    ],
                  ))
              : Container(),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

class HomeCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final IconData moodIcon;
  final String date;

  HomeCard(
      {this.child,
      this.color,
      this.onPressed,
      @required this.moodIcon,
      @required this.date});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: this.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: FlatButton(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(0.0),
          onPressed: this.onPressed,
          child: Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.loose,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height * 0.85,
                child: this.child != null ? this.child : Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.55,
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    this.date != null
                        ? Text(
                            this.date,
                            style: TextStyle(color: Colors.white),
                          )
                        : Container(),
                    this.moodIcon != null
                        ? Icon(
                            this.moodIcon,
                            color: Colors.white,
                      size: 25.0,
                          )
                        : Container(),
//                    (, style: TextStyle(color: Colors.white),),
                  ],
                ),
                color: Colors.transparent,
//                  decoration: BoxDecoration(
//                    color: Colors.transparent,
//                      gradient: LinearGradient(
//                          colors: [Colors.white, Colors.black],
////                        stops: [0.0, 1.0],
//                          begin: FractionalOffset.topCenter,
//                          end: FractionalOffset.bottomCenter)),
              ),
            ],
          ),
        ),
        elevation: 4.0,
        borderOnForeground: true,
      ),
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

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  List<PieChartSectionData> pieChartRawSections;
  List<PieChartSectionData> showingSections;

  StreamController<PieTouchResponse> pieTouchedResultStreamController;

  int touchedIndex;

  @override
  void initState() {
    super.initState();

    final section1 = PieChartSectionData(
      color: Color(0xff0293ee),
      value: 40,
      title: "40%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section2 = PieChartSectionData(
      color: Color(0xfff8b250),
      value: 30,
      title: "30%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section3 = PieChartSectionData(
      color: Color(0xff845bef),
      value: 15,
      title: "15%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final section4 = PieChartSectionData(
      color: Color(0xff13d38e),
      value: 15,
      title: "15%",
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );

    final items = [
      section1,
      section2,
      section3,
      section4,
    ];

    pieChartRawSections = items;

    showingSections = pieChartRawSections;

    pieTouchedResultStreamController = StreamController();
    pieTouchedResultStreamController.stream.distinct().listen((details) {
      if (details == null) {
        return;
      }

      touchedIndex = -1;
      if (details.sectionData != null) {
        touchedIndex = showingSections.indexOf(details.sectionData);
      }

      setState(() {
        if (details.touchInput is FlLongPressEnd) {
          touchedIndex = -1;
          showingSections = List.of(pieChartRawSections);
        } else {
          showingSections = List.of(pieChartRawSections);

          if (touchedIndex != -1) {
            final TextStyle style = showingSections[touchedIndex].titleStyle;
            showingSections[touchedIndex] =
                showingSections[touchedIndex].copyWith(
              titleStyle: style.copyWith(
                fontSize: 24,
              ),
              radius: 60,
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: FlChart(
                  chart: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(
                            touchResponseStreamSink:
                                pieTouchedResultStreamController.sink),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: showingSections),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: "First",
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: "Second",
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: "Third",
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: "Fourth",
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
            SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}

class BarChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  StreamController<BarTouchResponse> barTouchedResultStreamController;

  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5);
    final barGroup2 = makeGroupData(1, 6.5);
    final barGroup3 = makeGroupData(2, 5);
    final barGroup4 = makeGroupData(3, 7.5);
    final barGroup5 = makeGroupData(4, 9);
    final barGroup6 = makeGroupData(5, 11.5);
    final barGroup7 = makeGroupData(6, 6.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;

    barTouchedResultStreamController = StreamController();
    barTouchedResultStreamController.stream
        .distinct()
        .listen((BarTouchResponse response) {
      if (response == null) {
        return;
      }

      if (response.spot == null) {
        setState(() {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        });
        return;
      }

      touchedGroupIndex =
          showingBarGroups.indexOf(response.spot.touchedBarGroup);

      setState(() {
        if (response.touchInput is FlLongPressEnd) {
          touchedGroupIndex = -1;
          showingBarGroups = List.of(rawBarGroups);
        } else {
          showingBarGroups = List.of(rawBarGroups);
          if (touchedGroupIndex != -1) {
            showingBarGroups[touchedGroupIndex] =
                showingBarGroups[touchedGroupIndex].copyWith(
              barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                return rod.copyWith(color: Colors.yellow, y: rod.y + 1);
              }).toList(),
            );
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Color(0xff81e5cd),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Mingguan",
                style: TextStyle(
                    color: Color(0xff0f4a3c),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Grafik konsumsi kalori",
                style: TextStyle(
                    color: Color(0xff379982),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FlChart(
                    chart: BarChart(BarChartData(
                      barTouchData: BarTouchData(
                        touchTooltipData: TouchTooltipData(
                            tooltipBgColor: Colors.blueGrey,
                            getTooltipItems: (touchedSpots) {
                              return touchedSpots.map((touchedSpot) {
                                String weekDay;
                                switch (touchedSpot.spot.x.toInt()) {
                                  case 0:
                                    weekDay = 'Monday';
                                    break;
                                  case 1:
                                    weekDay = 'Tuesday';
                                    break;
                                  case 2:
                                    weekDay = 'Wednesday';
                                    break;
                                  case 3:
                                    weekDay = 'Thursday';
                                    break;
                                  case 4:
                                    weekDay = 'Friday';
                                    break;
                                  case 5:
                                    weekDay = 'Saturday';
                                    break;
                                  case 6:
                                    weekDay = 'Sunday';
                                    break;
                                }
                                return TooltipItem(
                                    weekDay +
                                        '\n' +
                                        touchedSpot.spot.y.toString(),
                                    TextStyle(color: Colors.yellow));
                              }).toList();
                            }),
                        touchResponseSink:
                            barTouchedResultStreamController.sink,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                            showTitles: true,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            margin: 16,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'M';
                                case 1:
                                  return 'T';
                                case 2:
                                  return 'W';
                                case 3:
                                  return 'T';
                                case 4:
                                  return 'F';
                                case 5:
                                  return 'S';
                                case 6:
                                  return 'S';
                              }
                            }),
                        leftTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: showingBarGroups,
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [
      BarChartRodData(
        y: y,
        color: barColor,
        width: width,
        isRound: true,
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          y: 20,
          color: barBackgroundColor,
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    barTouchedResultStreamController.close();
  }
}
