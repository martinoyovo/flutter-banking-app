import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/pages/add_card.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(title: "All Cards", implyLeading: true, context: context),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => AddCard())),
                child: Container(
                  width: size.width*0.78,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Styles.primaryWithOpacityColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.add, color: Colors.white, size: 20,),
                      Gap(10),
                      Text("ADD NEW CARD", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Styles.primaryWithOpacityColor,
                child: Icon(IconlyBold.Scan, color: Colors.white,),
                radius: 23,
              )
            ],
          ),
          Gap(22),
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
                        color: Color(0xFF7be8b8)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.cardsMastercard, width: 60, height: 50, fit: BoxFit.cover,),
                        Text("\$20,000.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Styles.primaryColor),),
                        Gap(20),
                        Text("CARD NUMBER", style: TextStyle(color: Styles.primaryColor.withOpacity(0.7), fontSize: 12),),
                        Gap(5),
                        Text("3829 4820 4629 5025", style: TextStyle(color: Styles.primaryColor, fontSize: 15),),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width*0.27,
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
                        color: Styles.accentColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                          ),
                          child: Icon(Icons.swipe_rounded, color: Styles.accentColor, size: 20,),
                        ),
                        Spacer(),
                        Text("VALID", style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.5)),),
                        Gap(5),
                        Text("06/22", style: TextStyle(fontSize: 15, color: Colors.white),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Gap(20),
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
                        color: Color(0xFFFF9E44)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.cardsPaionner, width: 80, height: 50, fit: BoxFit.cover,),
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
                              color: Styles.primaryColor
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
          )
        ],
      ),
    );
  }
}
