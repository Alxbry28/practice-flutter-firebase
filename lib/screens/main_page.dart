import 'package:flutter/material.dart';
import 'package:practicefirebase/models/user.dart';
import 'package:practicefirebase/screens/fourth.dart';
import 'package:practicefirebase/screens/third.dart';
import 'package:practicefirebase/screens/user_page.dart';
import 'package:practicefirebase/services/FirestoreDb.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ThirdPage()));
            },
            icon: Icon(Icons.people),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FourthPage()));
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),

      //Realtime
      body: StreamBuilder<List<User>>(
        stream: FirestoreDb().readUsers(),
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
      onTap: () {
        print("test tap list tile");
      },
      leading: CircleAvatar(
        child: Text("${user.age}"),
      ),
      title: Text(user.name!),
      subtitle: Text(user.birthday!),
      trailing: IconButton(
          onPressed: () async {
            await FirestoreDb().deleteUser(user.id!);
            print("user id: ${user.id}");
          },
          icon: Icon(Icons.delete)),
    );
