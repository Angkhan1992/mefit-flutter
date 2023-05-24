import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CoreDialog {
  static makeToast(
    String message, {
    ToastStatus type = ToastStatus.success,
  }) {
    Color background = Colors.green;
    String webBackground = "";
    switch (type) {
      case ToastStatus.success:
        background = Colors.greenAccent;
        webBackground = "linear-gradient(to right, #00E676, #00E676)";
        break;
      case ToastStatus.failed:
        background = Colors.redAccent;
        webBackground = "linear-gradient(to right, #FF1744, #FF1744)";
        break;
      case ToastStatus.warning:
        background = Colors.orangeAccent;
        webBackground = "linear-gradient(to right, #FF9100, #FF9100)";
        break;
      case ToastStatus.info:
        background = Colors.blueGrey;
        webBackground = "linear-gradient(to right, #78909C, #78909C)";
        break;
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: kIsWeb ? ToastGravity.BOTTOM_RIGHT : ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: background,
      textColor: Colors.white,
      webBgColor: webBackground,
      fontSize: 16.0,
    );
  }
}

enum ToastStatus {
  success,
  failed,
  warning,
  info,
}
