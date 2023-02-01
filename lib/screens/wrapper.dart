import 'package:flutter/material.dart';
import 'package:practicefirebase/screens/auth/authenticate.dart';
import 'package:practicefirebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //Return home or auth widget
    return Authenticate();
  }
}