import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/repo/repository.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/views/add_card.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Repository.bgColor(context),
      appBar: myAppBar(title: 'All Cards', implyLeading: false, context: context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const AddCard())),
                child: Container(
                  width: size.width * 0.78,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Repository.accentColor(context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.add, color: Repository.textColor(context), size: 20),
                      const Gap(10),
                      Text('ADD NEW CARD',
                          style: TextStyle(color: Repository.textColor(context)))
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Repository.accentColor(context),
                child: Icon(IconlyBold.Scan, color: Repository.textColor(context)),
                radius: 23,
              )
            ],
          ),
          const Gap(22),
          FittedBox(
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.67,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(15)),
                      color: Styles.greenColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.cardsVisaYellow,
                            width: 60, height: 50, fit: BoxFit.cover),
                        const Text('\$20,000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white)),
                        const Gap(20),
                        Text('CARD NUMBER',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12)),
                        const Gap(5),
                        const Text('3829 4820 4629 5025',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.27,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: Styles.yellowColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.greenColor,
                          ),
                          child: const Icon(Icons.swipe_rounded,
                              color: Colors.white, size: 20),
                        ),
                        const Spacer(),
                        const Text('VALID', style: TextStyle(fontSize: 12)),
                        const Gap(5),
                        const Text('05/22', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Gap(20),
          FittedBox(
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.67,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(15)),
                      color: Color(0xFF7be8b8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.cardsMastercard,
                            width: 60, height: 50, fit: BoxFit.cover),
                        Text('\$20,000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Styles.primaryColor)),
                        const Gap(20),
                        Text('CARD NUMBER',
                            style: TextStyle(
                                color: Styles.primaryColor.withOpacity(0.7),
                                fontSize: 12)),
                        const Gap(5),
                        Text('3829 4820 4629 5025',
                            style: TextStyle(
                                color: Styles.primaryColor, fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.27,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: Styles.greenColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.swipe_rounded,
                              color: Styles.greenColor, size: 20),
                        ),
                        const Spacer(),
                        Text('VALID',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.5))),
                        const Gap(5),
                        const Text('06/22',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Gap(20),
          FittedBox(
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.67,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(15)),
                      color: Color(0xFFFF9E44),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.cardsPaionner,
                            width: 80, height: 50, fit: BoxFit.cover),
                        const Text('\$20,000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white)),
                        const Gap(20),
                        Text('CARD NUMBER',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12)),
                        const Gap(5),
                        const Text('3829 4820 4629 5025',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.27,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: Styles.yellowColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.primaryColor,
                          ),
                          child: const Icon(Icons.swipe_rounded,
                              color: Colors.white, size: 20),
                        ),
                        const Spacer(),
                        const Text('VALID', style: TextStyle(fontSize: 12)),
                        const Gap(5),
                        const Text('05/22', style: TextStyle(fontSize: 15)),
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
