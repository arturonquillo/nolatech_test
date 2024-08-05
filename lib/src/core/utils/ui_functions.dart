// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class UiFunctions {
  static showSnackBar(
      BuildContext context, String titleText, String subtitleText) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[300],
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blue[300],
      messageText: Text(
        subtitleText,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.green,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    ).show(context);
  }
}
