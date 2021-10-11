import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/json/shortcut_list.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(title: "", implyLeading: true, context: context),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Gap(40),
          Stack(
            children: [
              Container(
                height: 280,
                alignment: Alignment.bottomCenter,
                color: Styles.primaryColor,
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Styles.primaryWithOpacityColor
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(60),
                      Center(child: Text("Tino Well", style: TextStyle(color: Colors.white, fontSize: 25),)),
                      Gap(10),
                      Text("FCW-587462", style: TextStyle(color: Colors.white.withOpacity(0.7)),),
                      Gap(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: profilesShortcutList.map<Widget>((e) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(e["icon"], color: e["color"],),
                          );
                        }).toList(),
                      ),
                      Gap(25)
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30,
                right: 30,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE486DD)
                  ),
                  child: Transform.scale(
                  scale: 0.55,
                      child: Image.asset(Assets.dash)),
                ),
              )
            ],
          ),
          Gap(35),
          customListTile(icon: IconlyBold.Profile, color: Color(0xFFC76CD9), title: 'Information'),
          customListTile(icon: IconlyBold.Shield_Done, color: Color(0xFF229e76), title: 'Security'),
          customListTile(icon: IconlyBold.Message, color: Color(0xFFe17a0a), title: 'Contact us'),
          customListTile(icon: IconlyBold.Document, color: Color(0xFF064c6d), title: 'Support'),
          customListTile(icon: Icons.dark_mode, color: Color(0xFF0536e8), title: 'Dark Mode', isDarkMode: true),
        ],
      ),
    );
  }


  Widget customListTile({required IconData icon, required String title, VoidCallback? callback, required Color color, bool? isDarkMode}) {
    return ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 2),
        leading: Container(
          width: 42,
          height: 42,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Styles.primaryWithOpacityColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 18,),
        ),
        minLeadingWidth: 50,
        horizontalTitleGap: 13,
        title: Text(title, style: TextStyle(fontSize: 17, color: Colors.white),),
        trailing: isDarkMode == true ? CupertinoSwitch(
          thumbColor: Styles.blueColor,
            activeColor: Colors.white,
            trackColor: Colors.white,
            value: true, onChanged: (v) {
        }) : Icon(CupertinoIcons.arrow_right, color: Colors.white.withOpacity(0.7),),
        onTap: callback == null ? null : callback
    );
  }
}
