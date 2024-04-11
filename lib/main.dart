import 'package:colors_app/auth/auth.dart';
import 'package:colors_app/auth/login_register.dart';
import 'package:colors_app/firebase_options.dart';
import 'package:colors_app/pages/chat_page.dart';
import 'package:colors_app/pages/create_color_page.dart';
import 'package:colors_app/pages/home_page.dart';
import 'package:colors_app/pages/main_page.dart';
import 'package:colors_app/pages/profile_page.dart';
import 'package:colors_app/pages/users_page.dart';
import 'package:colors_app/theme/dark_mode.dart';
import 'package:colors_app/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authentication(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => LoginOrRegister(),
        '/main_page': (context) => MainPage(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProfilePage(),
        '/users_page': (context) => UsersPage(),
        '/colors_page': (context) => CreateColorPage(),
        '/chat_page': (context) => ChatPage(),
      },
    );
  }
}
