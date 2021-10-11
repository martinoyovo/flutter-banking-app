import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/json/shortcut_list.dart';
import 'package:flutter_banking_app/json/transactions.dart';
import 'package:flutter_banking_app/pages/add_card.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final size = Layouts.getSize(context);
    return Material(
      color: Styles.primaryColor,
      elevation: 0,
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Gap(getProportionateScreenHeight(50)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi Tino', style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16)),
                  Gap(3),
                  Text('Welcome back', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Icon(IconlyBold.Notification),
                ),
              )
            ],
          ),
          Gap(25),
          FittedBox(
            child: Container(
              height: size.height*0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width*0.67,
                    padding: EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
                      color: Styles.accentColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.cardsVisaYellow, width: 60, height: 50, fit: BoxFit.cover,),
                        Text("\$20,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),),
                        Gap(20),
                        Text("CARD NUMBER", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),),
                        Gap(5),
                        Text("3829 4820 4629 5025", style: TextStyle(color: Colors.white, fontSize: 15),),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width*0.27,
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
                        color: Styles.yellowColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.accentColor
                          ),
                          child: Icon(Icons.swipe_rounded, color: Colors.white, size: 20,),
                        ),
                        Spacer(),
                        Text("VALID", style: TextStyle(fontSize: 12),),
                        Gap(5),
                        Text("05/22", style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Gap(20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Styles.primaryWithOpacityColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: shortcutList.map<Widget>((item) {
                return InkWell(
                  onTap: () => item['route'] == null ? null : Navigator.push(context, MaterialPageRoute(builder: (c) => item['route'])),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item['color'].withOpacity(0.15)
                    ),
                    child: Icon(item['icon'], color: item['color'],),
                  ),
                );
              }).toList(),
            ),
          ),
          Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Text("Today", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),),
                  Gap(3),
                  Icon(CupertinoIcons.chevron_down, color: Colors.white.withOpacity(0.5), size: 17,)
                ],
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (c, i) {
              final trs = transactions[i];
              return ListTile(
                isThreeLine: true,
                minLeadingWidth: 10,
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
}
