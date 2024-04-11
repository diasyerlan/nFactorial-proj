import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 170),
              Container(
                  height: 50,
                  child: Text(
                    'M E N U',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.home),
                  title: Text('H O M E'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/profile_page');
                  },
                  leading: Icon(Icons.home),
                  title: Text('P R O F I L E'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/users_page');
                  },
                  leading: Icon(Icons.home),
                  title: Text('U S E R S'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 25),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
                logout();
              },
              leading: Icon(Icons.logout),
              title: Text('L O G O U T'),
            ),
          ),
        ],
      ),
    );
  }
}
