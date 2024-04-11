import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  UserTile({super.key, required this.onTap, required this.username});
  final void Function()? onTap;
  final String username;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                width: 20,
              ),
              Text(username, style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
