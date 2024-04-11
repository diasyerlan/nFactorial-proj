import 'package:colors_app/pages/login_page.dart';
import 'package:colors_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool onloginPage = true;

  togglePages() {
    setState(() {
      onloginPage = !onloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (onloginPage) {
      return LogInPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
