import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:practicefirebase/config/settings.dart';
import 'package:practicefirebase/models/userModel.dart';

class UpdateDataPage extends StatefulWidget {
  const UpdateDataPage({
    Key? key,
    required this.personKey,
  }) : super(key: key);
  final String personKey;

  @override
  State<UpdateDataPage> createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateDataPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Firebase.initializeApp();
    // dbRef = FirebaseDatabase.instance.refFromURL(AppSettings.FirebaseDbRealtimeURL).child("Students");
    dbRef = FirebaseDatabase.instance.ref().child("Person");
    setStudentData();
  }

  void setStudentData() async {
    // DataSnapshot snapshot =
    //     (await dbRef.child(widget.personKey).once()) as DataSnapshot;
    debugPrint("UpdateDataPage: ${widget.personKey}");
    dbRef.child(widget.personKey).onValue.listen((event) {
      Map person = event.snapshot.value as Map;

      _usernameController.text = person["username"];
      _firstNameController.text = person["firstname"];
      _lastNameController.text = person["lastname"];
      _emailController.text = person["email"];
      _mobileNumberController.text = person["mobileNumber"];
      _passwordController.text = person["password"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data Page"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "First Name",
                  ),
                  maxLength: 30,
                  onSaved: (newValue) => setState(() {
                    user.firstname == newValue;
                  }),
                  onChanged: (newValue) => setState(() {
                    user.firstname == newValue;
                  }),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please enter correct name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Last Name",
                  ),
                  onSaved: (newValue) => setState(() {
                    user.lastname = newValue;
                  }),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Please enter correct name";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mobile Number",
                  ),
                  onSaved: (newValue) => setState(() {
                    user.mobileNumber = newValue;
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter mobilenume";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: "Username",
                      labelText: "Enter your Username"),
                  onSaved: (newValue) => setState(() {
                    user.username = newValue;
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter correct username";
                    } else if (value.length < 8) {
                      return "Please enter at least 8 characters";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: "Username",
                      labelText: "Enter your Email"),
                  onSaved: (newValue) => setState(() {
                    user.email = newValue;
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter correct email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: "Username",
                      labelText: "Enter your Password"),
                  onSaved: (newValue) => setState(() {
                    user.password = newValue;
                  }),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    } else if (value.length < 8) {
                      return "Please enter at least 8 characters";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: "Username",
                      labelText: "Enter Confirm Password"),
                  onSaved: (newValue) => setState(() {
                    user.password = newValue;
                  }),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    } else if (value.length < 8) {
                      return "Please enter at least 8 characters";
                    } else if (_passwordController.text.trim() !=
                        _confirmPasswordController.text.trim()) {
                      return "Password not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();
                          FocusScope.of(context).unfocus();

                          if (isValid) {
                            _formKey.currentState!.save();
                            user.firstname = _firstNameController.text.trim();
                            user.id = widget.personKey;
                            debugPrint(user.toString());
                            dbRef
                                .child(widget.personKey)
                                .update(user.toMap())
                                .then((value) => Navigator.pop(context));
                                
                                // showDialog(
                                //       context: context,
                                //       builder: (context) => const AlertDialog(
                                //           content: Text(
                                //               "Successfully Update the data")),
                                //     ));
                          }
                        },
                        child: const Text("Submit")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
