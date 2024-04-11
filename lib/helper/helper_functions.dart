import 'package:flutter/material.dart';

void displayMessage(String text, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
        );
      });
}
