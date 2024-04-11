import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

class CreateColorPage extends StatefulWidget {
  const CreateColorPage({super.key});

  @override
  State<CreateColorPage> createState() => _CreateColorPageState();
}

class _CreateColorPageState extends State<CreateColorPage> {
  var firestoreInstance = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  Color _currentColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ColorPicker(onChanged: (color) {
                  setState(() {
                    _currentColor = color;
                  });
                }),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: _currentColor),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          firestoreInstance
                              .collection('Users')
                              .doc(firebaseUser!.email)
                              .update({
                            'colors': FieldValue.arrayUnion(
                                [_currentColor.toString()])
                          });
                          final snackBar = SnackBar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              content: Text('Color is created successfully!'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Text('Create'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
