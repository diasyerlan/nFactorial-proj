import 'package:colors_app/components/user_tile.dart';
import 'package:colors_app/pages/message_page.dart';
import 'package:colors_app/services/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  ChatService chat = ChatService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: chat.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data == null) {
          return Text("No data");
        }
        return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList());
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != FirebaseAuth.instance.currentUser!.email) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: UserTile(
          username: userData['username'],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagePage(
                    receiverEmail: userData['email'],
                    receiverID: userData['username'],
                  ),
                ));
          },
        ),
      );
    } else {
      return Container();
    }
  }
}
