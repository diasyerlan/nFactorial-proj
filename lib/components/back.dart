import 'package:flutter/material.dart';

class MyBack extends StatelessWidget {
  const MyBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
