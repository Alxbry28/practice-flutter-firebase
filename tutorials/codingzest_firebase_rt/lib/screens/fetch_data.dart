import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:practicefirebase/models/userModel.dart';
import 'package:practicefirebase/screens/update_data.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({super.key});

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  late DatabaseReference dbRef;
  late Query dbRefQuery;
  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref().child("Person");
    dbRefQuery = FirebaseDatabase.instance.ref().child("Person");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data Page"),
      ),
      body: Container(
        child: FirebaseAnimatedList(
          query: dbRefQuery,
          itemBuilder: (context, snapshot, animation, index) {
            Map<String, dynamic> person =
                Map<String, dynamic>.from(snapshot.value as Map);
            person["key"] = snapshot.key;

            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              height: 150,
              color: Colors.amberAccent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(children: [
                      const Text("Name:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${person['firstname']} ${person['lastname']}")
                    ]),
                    Row(children: [
                      const Text("Email:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${person['email']}")
                    ]),
                    Row(children: [
                      const Text("Mobile Number:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${person['mobileNumber']}")
                    ]),
                    Row(children: [
                      const Text("Username:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${person['username']}")
                    ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                debugPrint("Edit ${person["key"]}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => UpdateDataPage(
                                              personKey: person["key"]
                                            )));
                              },
                              icon: const Icon(Icons.edit, color: Colors.blue)),
                          IconButton(
                              onPressed: () {
                                debugPrint("Delete ${person["key"]}");
                                dbRef.child(person['key']).remove();
                              },
                              icon:
                                  const Icon(Icons.delete, color: Colors.red)),
                        ]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
