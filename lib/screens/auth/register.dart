import 'package:flutter/material.dart';

import 'package:practicefirebase/services/auth.dart';

class Register extends StatefulWidget {
  const Register({
    Key? key,
    required this.toggleView,
  }) : super(key: key);
  final Function toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();

  //text field state
  String? email = "";
  String? password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign Up to Brew Crew"),
        actions: [TextButton.icon(onPressed: (){ 
          widget.toggleView();

        }, icon: Icon(Icons.person), label: Text("Sign In"))],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  print("email: ${email} ; password: ${password} ;");
                },
                child: Text("Register"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              ),
            )
          ],
        )),
      ),
    );
  }
}
