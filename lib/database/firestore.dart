import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  late User? user;
  late DocumentReference docRef;

  FirestoreDatabase() {
    user = FirebaseAuth.instance.currentUser;
    docRef = FirebaseFirestore.instance.collection('Users').doc(user!.email);
  }

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Posts');

  Future<void> addPosts(String message, String color) async {
    // Await the result of getUsername() before adding it to the document
    String username = await getUsername();
    await collectionReference.add({
      'username': username, // Use the awaited username
      'message': message,
      'color': color,
      'time': Timestamp.now()
    });
  }

  Stream<QuerySnapshot> getData() {
    return FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('time', descending: true)
        .snapshots();
  }

  Future<String> getUsername() async {
    DocumentSnapshot snapshot = await docRef.get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    String username = data['username']; // Remove await from here
    return username;
  }
}
