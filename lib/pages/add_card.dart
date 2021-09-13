import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/default_text_field.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';

class AddCard extends StatefulWidget {
  AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController _cardHolderName = TextEditingController();
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _expiryDate = TextEditingController();
  TextEditingController _cvc = TextEditingController();
  List paymentCardsList = [
    Assets.cardsVisa,
    Assets.cardsMastercard,
    Assets.cardsPaypal,
    Assets.cardsSkrill
  ];
  int selectedCard = 0;
  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    final cardSize = size.height*0.23;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(title: "Add Card", implyLeading: true, context: context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Container(
            width: double.infinity,
            height: cardSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: cardSize*0.35,
                  padding: EdgeInsets.fromLTRB(16, 10, 20, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      color: Styles.accentColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.cardsVisaWhite, width: 60, height: 45, fit: BoxFit.cover,),
                      Text("\$00.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 12, 0, 0),
                  height: cardSize*0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                      color: Styles.yellowColor
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customColumn(title: "CARD NUMBER", subtitle: "**** **** **** ****"),
                      Gap(5),
                      Row(
                        children: [
                          customColumn(title: "CARD HOLDER NAME", subtitle: "N/A"),
                          Gap(40),
                          customColumn(title: "VALID", subtitle: "N/A")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: paymentCardsList.map<Widget>((paymentCard) {
              return MaterialButton(
                elevation: 0,
                color: Color(0xFF232D40),
                minWidth: 70,
                height: 100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(paymentCard),
                          fit: BoxFit.contain
                        )
                      ),
                    ),
                    Gap(15),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 700),
                      child: Icon(selectedCard == paymentCardsList.indexOf(paymentCard)
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                        color: selectedCard == paymentCardsList.indexOf(paymentCard) ? Styles.blueColor : Colors.white.withOpacity(0.5),),
                    )
                  ],
                ),
                onPressed: () {
                  setState(() {
                    selectedCard = paymentCardsList.indexOf(paymentCard);
                  });
                },
              );
            }).toList(),
          ),
          Gap(30),
          DefaultTextField(controller: _cardHolderName, title: "Card Holder Name"),
          DefaultTextField(controller: _cardNumber, title: "Card Number", label: "5632-1587-536-256",),
          Row(
            children: [
              Flexible(
                child: DefaultTextField(controller: _cardNumber, title: "Expiry date", label: "05/2022",),
              ),
              Gap(10),
              Flexible(
                child: DefaultTextField(controller: _cardNumber, title: "CVC/CVV", label: "******", obscure: true,),
              ),
            ],
          ),
          Gap(10),
          elevatedButton(
            color: Styles.blueColor,
            context: context,
            callback: () {

            },
            text: "Add Card"
          )
        ],
      ),
    );
  }

  Widget customColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: TextStyle(fontSize: 12),),
        Gap(4),
        Text(subtitle, style: TextStyle(fontSize: 16),),
      ],
    );
  }
}