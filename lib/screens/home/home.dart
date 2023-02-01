import 'package:flutter/material.dart';
import 'package:practicefirebase/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
        
          IconButton(
            onPressed: () async {
              await _auth.signout();
            },
            icon: Icon(Icons.logout),
            
          ),
        ],
      ),
    );
  }
}
