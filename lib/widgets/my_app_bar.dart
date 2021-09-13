import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar myAppBar({required String title, String? stringColor, required bool implyLeading, required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18),),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: implyLeading == true ? Transform.scale(
        scale: 0.7,
        child: IconButton(
          icon: Icon(Icons.keyboard_backspace_rounded, size: 33, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        )
    ) : SizedBox(),
  );
}