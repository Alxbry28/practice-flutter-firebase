import 'package:flutter/material.dart';
import 'package:practicefirebase/models/user.dart';
import 'package:practicefirebase/screens/user_page.dart';
import 'package:practicefirebase/services/FirestoreDb.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users (Not realtime, single user)"),
      ),

      //Single User
      body: FutureBuilder<User?>(
        future: FirestoreDb().readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong!");
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return user != null
                ? buildUser(user)
                : Center(child: Text("No User"));
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
