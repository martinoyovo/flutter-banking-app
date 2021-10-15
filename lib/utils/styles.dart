import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/size_config.dart';

class Styles {
  static Color primaryColor = const Color(0xFF161D28);
  static Color primaryWithOpacityColor = const Color(0xFF212E3E);
  static Color yellowColor = const Color(0xFFDFE94B);
  static Color accentColor = const Color(0xFF024751);
  static Color greyColor = const Color(0xFFDFE1E3);
  static Color buttonColor = const Color(0xFF4C66EE);
  static Color blueColor = const Color(0xFF4BACF7);
  static TextStyle textStyle =
      TextStyle(fontSize: getProportionateScreenWidth(15));
  static TextStyle titleStyle = TextStyle(
      fontFamily: 'DMSans',
      fontSize: getProportionateScreenWidth(19),
      fontWeight: FontWeight.w500);
}
