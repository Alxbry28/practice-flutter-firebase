import 'package:flutter/material.dart';

import 'package:practicefirebase/services/auth.dart';
import 'package:practicefirebase/shared/constants.dart';
import 'package:practicefirebase/shared/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
    required this.toggleView,
  }) : super(key: key);
  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String? email = "";
  String? password = "";
  String? error = "";

  @override
  Widget build(BuildContext context) {
    // return ? : ;

    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In to Brew Crew"),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter email";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: textInputDecoration.copyWith(
                    hintText: "Enter Email",
                    labelText: "Email",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter passsword";
                    } else if (value.length < 8) {
                      return "Enter a passsword with 8 characters long.";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: textInputDecoration.copyWith(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        // _formKey.currentState!.save();
                        dynamic result = await _authService
                            .signInWithEmailAndPassword(email!, password!);

                        if (result == null) {
                          setState(() {
                            error = "Could not sign in with the credentials";
                            loading = false;
                          });
                        } else {
                          print("email: ${email} ; password: ${password} ;");
                        }
                      }
                    },
                    child: Text("Sign In"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  error!,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            )),
      ),
    );
  }
}
