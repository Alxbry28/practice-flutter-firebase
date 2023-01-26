import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Signed In as: ${user.currentUser?.email}"),
          ElevatedButton(
            child: Text("Sign Out"),
            onPressed: () {
              setState(() {
                user.signOut();
              });
            },
          ),
        ],
      )),
    );
  }
}
