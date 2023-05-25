// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MTAdminTheme {
  late BuildContext context;

  MTAdminTheme({
    required this.context,
  }) {
    _mtAdminTheme = this;
  }

  factory MTAdminTheme.initWithContext(BuildContext context) =>
      MTAdminTheme(context: context);

  static MTAdminTheme? _mtAdminTheme;
  static MTAdminTheme? get instance => _mtAdminTheme;

  ColorScheme get colorScheme => Theme.of(context).colorScheme;
  Color get primary => Theme.of(context).colorScheme.primary;
  Color get onPrimay => Theme.of(context).colorScheme.onPrimary;
  Color get secondary => Theme.of(context).colorScheme.secondary;

  TextStyle get headerTitle => const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get title => const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get appBarTitle => const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get subTitle => const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      );

  TextStyle get cardTitle => const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w300,
      );
  TextStyle get cardContent => const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      );
}
