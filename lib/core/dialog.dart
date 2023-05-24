// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CoreDialog {
  late BuildContext context;

  CoreDialog({
    required this.context,
  });

  factory CoreDialog.of(BuildContext context) => CoreDialog(context: context);

  void showSnakeBar({
    required String desc,
    String? title,
    Widget? prefix,
    ToastStatus type = ToastStatus.success,
  }) {
    var backgroundColor = Colors.green;
    switch (type) {
      case ToastStatus.warning:
        backgroundColor = Colors.deepOrange;
        break;
      case ToastStatus.info:
        backgroundColor = Colors.cyan;
        break;
      case ToastStatus.failed:
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.green;
        break;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        content: Container(
          constraints: const BoxConstraints(
            maxWidth: 600.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 20.0,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefix != null) ...{
                prefix,
                const SizedBox(width: 12.0),
              },
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...{
                      Text(
                        desc,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                    },
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
