import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practicefirebase/screens/home/brew_list.dart';
import 'package:practicefirebase/services/auth.dart';
import 'package:practicefirebase/services/firestoredb.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: FirestoreDBService().brews,
      child: Scaffold(
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
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
