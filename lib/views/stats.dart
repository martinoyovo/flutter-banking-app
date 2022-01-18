import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/json/transactions.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Repository.bgColor(context),
      appBar: myAppBar(
          title: 'Stats',
          implyLeading: false,
          context: context,
          hasAction: true),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Repository.accentColor2(context),
              border: Border.all(color: Repository.accentColor(context))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                    child: Text('Total Balance',
                        style:
                            TextStyle(color: Repository.subTextColor(context)))),
                Divider(
                  color: Repository.dividerColor(context),
                  thickness: 2,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                    child: Text('\$20,000.00 USD',
                        style: TextStyle(
                            color: Repository.titleColor(context),
                            fontSize: 32,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          const Gap(20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Repository.accentColor2(context),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Repository.accentColor(context))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  width: size.width*0.44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Repository.headerColor(context)),
                  child: const Text('Income', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  width: size.width * 0.44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.transparent),
                  child: Text('Expenses',
                      style: TextStyle(
                          color: Repository.titleColor(context), fontSize: 17, fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          const Gap(20),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              border: Border.all(color: Repository.accentColor(context))
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Repository.iconColor(context),
                            child: const Icon(Icons.show_chart_rounded,
                                color: Colors.orange),
                          ),
                          const Gap(6),
                          CircleAvatar(
                            backgroundColor: Repository.iconColor(context),
                            child: Icon(CupertinoIcons.eye_slash_fill,
                                color: Repository.titleColor(context), size: 17),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Repository.cardColor2(context),
                        ),
                        child: Row(
                          children: [
                            const Text('This week',
                                style: TextStyle(color: Colors.white)),
                            const Gap(8),
                            Icon(CupertinoIcons.chevron_down,
                                color: Colors.white.withOpacity(0.8), size: 17)
                          ],
                        ),
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
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transactions',
                  style: TextStyle(
                      color: Repository.titleColor(context),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text('View all',
                      style: TextStyle(
                          color: Repository.titleColor(context), fontSize: 16)),
                  const Gap(3),
                  Transform.rotate(
                      angle: math.pi,
                      child: Icon(Icons.keyboard_backspace_rounded,
                          color: Repository.titleColor(context), size: 18))
                ],
              )
            ],
          ),
          const Gap(20),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (c, i) {
                final trs = transactions[i];
                return ListTile(
                  isThreeLine: true,
                  minLeadingWidth: 10,
                  minVerticalPadding: 20,
                  contentPadding: const EdgeInsets.all(0),
                  leading: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Repository.accentColor(context),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            color: Colors.white.withOpacity(0.1),
                            blurRadius: 2,
                            spreadRadius: 1,
                          )
                        ],
                        image: i == 0
                            ? null
                            : DecorationImage(
                          image: AssetImage(trs['avatar']),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: i == 0
                          ? Icon(trs['icon'],
                          color: const Color(0xFFFF736C), size: 20)
                          : const SizedBox()),
                  title: Text(trs['name'],
                      style: TextStyle(color: Repository.textColor(context), fontWeight: FontWeight.w500)),
                  subtitle: Text(trs['date'],
                      style: TextStyle(color: Repository.subTextColor(context))),
                  trailing: Text(trs['amount'],
                      style: const TextStyle(fontSize: 17, color: Colors.white)),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  LineChartData mainData() {
    List<Color> gradientColors = [
      Repository.selectedItemColor(context)
    ];
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
            //color: Repository.selectedItemColor(context),
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
          getTextStyles: (context, value) => const TextStyle(color: Colors.grey, fontSize: 17),
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
        show: false,
        border: Border.all(color: Repository.selectedItemColor(context), width: 1),
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
            gradientFrom: const Offset(100, 10),
            gradientTo: const Offset(100, 100),
            show: true,
            colors: [
              Repository.selectedItemColor(context).withOpacity(0.05),
              Repository.selectedItemColor(context),
            ],
          ),
        ),
      ],
    );
  }
}
