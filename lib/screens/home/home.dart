import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:practicefirebase/models/brew.dart';
import 'package:practicefirebase/screens/home/brew_list.dart';
import 'package:practicefirebase/services/auth.dart';
import 'package:practicefirebase/services/firestoredb.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Text("Bottom Sheet"),
          );
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: FirestoreDBService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () => _showSettingsPanel(),
              icon: const Icon(Icons.settings),
            ),
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
