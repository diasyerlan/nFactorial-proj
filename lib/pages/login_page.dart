import 'package:colors_app/components/button.dart';
import 'package:colors_app/components/textfield.dart';
import 'package:colors_app/helper/helper_functions.dart';
import 'package:colors_app/pages/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInPage extends StatefulWidget {
  final void Function()? onTap;

  LogInPage({super.key, required this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  void login() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      displayMessage(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25),
            Text(
              'C O L O R S',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 25),
            MyTextField(
                obscureText: false,
                hintText: 'Email',
                controller: _emailController),
            SizedBox(height: 10),
            MyTextField(
                obscureText: true,
                hintText: 'Password',
                controller: _passwordController),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgotPasswordPage();
                      }));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            MyButton(
              onTap: login,
              title: 'Log In',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register here!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
