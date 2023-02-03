import 'package:flutter/material.dart';
import 'package:practicefirebase/models/user.dart';
import 'package:practicefirebase/screens/user_page.dart';
import 'package:practicefirebase/services/FirestoreDb.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users (Not realtime)"),
      ),

      //Realtime
      body: FutureBuilder<List<User>>(
        future: FirestoreDb().readUsers().first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong!");
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(children: users.map(buildUser).toList());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => UserPage()));
          print("Click add fab");
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}

Widget buildUser(User user) => ListTile(
      leading: CircleAvatar(
        child: Text("${user.age}"),
      ),
      title: Text(user.name!),
      subtitle: Text(user.birthday!),
    );
