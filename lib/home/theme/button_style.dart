import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static const Color primaryColor = Colors.indigo;

  static final ButtonStyle linkButton = ButtonStyle(

    foregroundColor: MaterialStateProperty.all(primaryColor),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    ),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
  );
}