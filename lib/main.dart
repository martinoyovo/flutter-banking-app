import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Banking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "DMSans",
        primaryColor: Styles.primaryColor,
        backgroundColor: Styles.primaryColor
      ),
      home: BottomNav()
    );
  }
}