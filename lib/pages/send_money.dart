import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/json/user_list.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_light.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/default_text_field.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/people_slider.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;

class SendMoney extends StatefulWidget {
  SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    final cardSize = size.height*0.23;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(title: "Send Money", implyLeading: true, context: context),
      bottomSheet: Container(
        color: Styles.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: elevatedButton(
            color: Styles.blueColor,
            context: context,
            callback: () {

            },
            text: "Send Money"
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Styles.primaryWithOpacityColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Assets.cardsVisaWhite, width: 60, height: 45, fit: BoxFit.cover,),
                        Padding(
                          padding: EdgeInsets.only(top: 20, right: 5),
                          child: Text("\$20,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Colors.white),),
                        ),
                      ],
                    ),
                    Gap(24),
                    customColumn(title: "CARD NUMBER", subtitle: "3829 4820 4629 5025"),
                    Gap(15)
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 70,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                    color: Styles.primaryColor,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Styles.primaryWithOpacityColor
                    ),
                    child: Icon(Icons.keyboard_backspace_rounded, color: Colors.white.withOpacity(0.5), size: 18,)
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 18,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                    color: Styles.primaryColor,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Styles.primaryWithOpacityColor
                    ),
                    child: Transform.rotate(
                        angle: math.pi,
                        child: Icon(Icons.keyboard_backspace_rounded, color: Colors.white, size: 18,)
                    )
                  ),
                ),
              ),
            ],
          ),
          Gap(20),
          PeopleSlider(),
          Gap(10),
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
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$1600.00", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Styles.primaryColor,
                        ),
                        child: Row(
                          children: [
                            Text("USD", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                            Gap(8),
                            Icon(CupertinoIcons.chevron_down, color: Colors.white.withOpacity(0.7), size: 20,)
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                Divider(color: Styles.primaryColor, thickness: 2,),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text("Send Money Purpose", style: TextStyle(color: Colors.white.withOpacity(0.7)),)),
                Gap(10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.5)),),
        Gap(2),
        Text(subtitle, style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),),
      ],
    );
  }
}