import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colors_app/components/back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  User? user = FirebaseAuth.instance.currentUser;
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            } else if (snapshot.hasData) {
              Map<String, dynamic>? data = snapshot.data!.data();
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 70, left: 20),
                          child: MyBack()),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context).colorScheme.tertiary),
                      child: Icon(
                        Icons.person,
                        size: 100,
                      )),
                  SizedBox(height: 15),
                  Text(data!['username'],
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(
                    data['email'],
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              );
            } else {
              return Text('No data');
            }
          },
        ),
      ),
    );
  }
}
