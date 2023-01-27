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
  void initState() {
    // if (user.currentUser!.emailVerified == false) {
    //   user.currentUser?.sendEmailVerification();
    //   showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //             content: Text(
    //                 "You are not verified, please check your email to verify your account."),
    //             actions: [
    //               TextButton(
    //                   onPressed: () {
    //                     // Navigator.of(context).pop();
    //                     user.signOut();
    //                   },
    //                   child: const Text("Close"))
    //             ],
    //           ));
    // }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Signed In as: ${user.currentUser?.email}"),
          ElevatedButton(
            child: const Text("Sign Out"),
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
