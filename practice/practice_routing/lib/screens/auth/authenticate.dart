import 'package:flutter/material.dart';
import 'package:practicefirebase/screens/auth/register.dart';
import 'package:practicefirebase/screens/auth/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool toggleSignIn = true;

  void toggleView() {
    setState(() => toggleSignIn = !toggleSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return toggleSignIn ? SignIn(toggleView: toggleView) : Register(toggleView: toggleView);
  }
}
