
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';

inputDecoration({String? text, IconData? prefixIcon, Widget? suffixIcon}) {
  return InputDecoration(
      hintText: text,
      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
      //labelStyle: Styles.textStyle.copyWith(color: Styles.primaryColor),
      //focusColor: Styles.primaryColor,
      //hoverColor: Styles.primaryColor,
      prefixIcon: prefixIcon == null ? null : Icon(prefixIcon, color: Styles.primaryColor,),
      suffixIcon: suffixIcon,
      contentPadding: prefixIcon == null ? EdgeInsets.only(top: 15, left: 15) : EdgeInsets.only(top: 0),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.6), borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.6), borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.6), borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))),
  );
}