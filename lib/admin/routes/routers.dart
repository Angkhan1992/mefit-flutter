import 'package:flutter/material.dart';

class Routers {
  static Future<dynamic> goToLanding(BuildContext context) {
    return Navigator.of(context).pushReplacementNamed('/landing');
  }
}
