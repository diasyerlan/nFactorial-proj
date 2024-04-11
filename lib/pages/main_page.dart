import 'package:colors_app/components/drawer.dart';
import 'package:colors_app/pages/chat_page.dart';
import 'package:colors_app/pages/create_color_page.dart';
import 'package:colors_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CreateColorPage(),
    ChatPage(),
  ];
  void _navigateToBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
                onTabChange: _navigateToBottomBar,
                backgroundColor: Colors.black,
                tabs: [
                  GButton(
                    padding: EdgeInsets.all(18),
                    backgroundColor: Colors.grey[800],
                    icon: Icons.home,
                    iconSize: 32,
                    text: 'Home',
                    gap: 8,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.white,
                  ),
                  GButton(
                    padding: EdgeInsets.all(18),
                    backgroundColor: Colors.grey[800],
                    icon: Icons.add_circle,
                    iconSize: 32,
                    text: 'Create a color',
                    gap: 8,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.white,
                  ),
                  GButton(
                    padding: EdgeInsets.all(18),
                    backgroundColor: Colors.grey[800],
                    icon: Icons.message,
                    iconSize: 32,
                    text: 'Messages',
                    gap: 8,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    iconActiveColor: Colors.white,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
