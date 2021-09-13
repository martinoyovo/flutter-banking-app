import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/size_config.dart';

class Styles {
  static Color primaryColor = Color(0xFF161D28);
  static Color primaryWithOpacityColor = Color(0xFF212E3E);
  static Color yellowColor = Color(0xFFDFE94B);
  static Color accentColor = Color(0xFF024751);
  static Color greyColor = Color(0xFFDFE1E3);
  static Color buttonColor = Color(0xFF4C66EE);
  static Color blueColor = Color(0xFF4BACF7);
  static TextStyle textStyle = TextStyle(fontSize: getProportionateScreenWidth(15));
  static TextStyle titleStyle = TextStyle(
      fontFamily: "DMSans",fontSize: getProportionateScreenWidth(19), fontWeight: FontWeight.w500);

  static Color getColor(String? c) => c == null ? primaryColor : hexToColor(c);
  static TextStyle getOfferStyle(String? c) => TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: getColor(c));

}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, code.length), radix: 16) + 0xFF000000);
}