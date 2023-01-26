import 'package:flutter/material.dart';
import 'package:practicefirebase/pages/login_page.dart';
import 'package:practicefirebase/pages/sign_up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
      if(showLoginPage) return LoginPage(showRegisterPage: toggleScreens);
        return SignUpPage(showLoginPage: toggleScreens);
     
  }
}