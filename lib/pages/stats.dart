import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/json/transactions.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List<Color> gradientColors = [
    Styles.blueColor,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(title: "Statistics", implyLeading: true, context: context, hasAction: true),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.primaryWithOpacityColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                    child: Text("Total Balance", style: TextStyle(color: Colors.white.withOpacity(0.8)),)),
                Divider(color: Styles.primaryColor, thickness: 2,),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 25, 20, 30),
                    child: Text("\$20,000.00 USD", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),)),
              ],
            ),
          ),
          Gap(20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Styles.primaryWithOpacityColor,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  width: size.width*0.44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Styles.primaryColor
                  ),
                  child: Text("Income", style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  width: size.width*0.44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent
                  ),
                  child: Text("Expenses", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18),),
                ),
              ],
            ),
          ),
          Gap(20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Styles.primaryWithOpacityColor
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(22, 22, 22, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            child: Icon(Icons.show_chart_rounded, color: Colors.orange,),
                          ),
                          Gap(6),
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.15),
                            child: Icon(CupertinoIcons.eye_slash_fill, color: Colors.white.withOpacity(0.8), size: 17,),
                          ),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Styles.primaryColor,
                          ),
                          child: Row(
                            children: [
                              Text("This week", style: TextStyle(color: Colors.white),),
                              Gap(8),
                              Icon(CupertinoIcons.chevron_down, color: Colors.white.withOpacity(0.8), size: 17,)
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.70,
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ],
            ),
          ),
          Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Text("View all", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),),
                  Gap(3),
                  Transform.rotate(
                      angle: math.pi,
                      child: Icon(Icons.keyboard_backspace_rounded, color: Colors.white.withOpacity(0.8), size: 18,)
                  )
                ],
              )
            ],
          ),
          Gap(20),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (c, i) {
              final trs = transactions[i];
              return ListTile(
                isThreeLine: true,
                minLeadingWidth: 10,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(0),
                leading: Container(
                  width: 35,
                  height: 35,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Styles.primaryWithOpacityColor,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 1
                      )
                    ],
                    image: i == 0 ? null : DecorationImage(
                        image: AssetImage(trs["avatar"]),
                        fit: BoxFit.cover
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: i == 0 ? Icon(trs["icon"], color: Color(0xFFFF736C), size: 20,) : SizedBox(),
                ),
                title: Text(trs["name"], style: TextStyle(color: Colors.white),),
                subtitle: Text(trs["date"], style: TextStyle(color: Colors.white.withOpacity(0.5)),),
                trailing: Text(trs["amount"], style: TextStyle(fontSize: 17, color: Colors.white),),
              );
            },
          )
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 40,
          interval: 1.1,
          getTextStyles: (context, value) => TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 17),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'S';
              case 2:
                return 'M';
              case 3:
                return 'T';
              case 4:
                return 'W';
              case 5:
                return 'T';
              case 6:
                return 'F';
              case 7:
                return 'S';
            }
            return '';
          },
          margin: 15,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
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
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: false, border: Border.all(color: const Color(0xff37434d), width: 1)
      ),
      minX: 0,
      maxX: 9,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1.5, 3),
            FlSpot(3.5, 5),
            FlSpot(5, 3),
            FlSpot(6.5, 4),
            FlSpot(8, 2.8),
            FlSpot(9, 3),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            //applyCutOffY: true,
            //cutOffY: 100,
            gradientFrom: Offset(100, 10),
            gradientTo: Offset(100,100),
            show: true,
            colors: [
              Colors.indigo.withOpacity(0.1),
              Colors.indigo
            ],
          ),
        ),
      ],
    );
  }
}