import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practicefirebase/read_data/get_user_name.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance;
  List<String> docIDs = [];

  Future getDocId() async {
    await FirebaseFirestore.instance.collection("users").get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

  Future getDocIdOrderedBy() async {
    await FirebaseFirestore.instance
        .collection("users")
        // .orderBy("age", descending: false)
        .orderBy("age", descending: true)
        // .where("age", isLessThan: 22)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.currentUser!.email.toString()),
        actions: [
          IconButton(
              onPressed: () {
                user.signOut();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                // future: getDocId(),
                future: getDocIdOrderedBy(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GetUserName(documentId: docIDs[index]),
                        tileColor: Colors.grey[100],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
