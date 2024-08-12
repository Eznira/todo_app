import 'dart:ui';

import 'package:flutter/material.dart';

//Custom Alertdialog buttons
class MyButton extends StatelessWidget {
  MyButton({
            super.key,
            required String this.text,
            required VoidCallback this.ontap});

  final String text;
  VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(text),style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding as needed
      textStyle: TextStyle(fontSize: 14.0), // Adjust font size as needed
    ),);

  }
}
