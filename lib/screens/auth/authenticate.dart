import 'package:flutter/material.dart';
import 'package:practicefirebase/screens/auth/register.dart';
import 'package:practicefirebase/screens/auth/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: SignIn(),
      child: Register(),
    );
  }
}
