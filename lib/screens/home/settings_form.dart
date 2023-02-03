import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:practicefirebase/models/user.dart';
import 'package:practicefirebase/services/firestoredb.dart';
import 'package:practicefirebase/shared/constants.dart';
import 'package:practicefirebase/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  //formaa values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    return StreamBuilder<UserData>(
        stream: FirestoreDBService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Loading();
          }
          UserData user_data = snapshot.data!;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Update your brew settings.",
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: user_data.name,
                  decoration: textInputDecoration,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a name" : null,
                  onChanged: (value) => setState(() {
                    _currentName = value;
                  }),
                ),
                const SizedBox(height: 20),
                //Dropdown
                DropdownButtonFormField(
                  value: _currentSugars ?? user_data.sugars,
                  hint: const Text("Select Sugar"),
                  items: sugars
                      .map((sugar) => DropdownMenuItem(
                            value: sugar,
                            child: Text("$sugar sugars"),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    _currentSugars = value;
                  }),
                ),

                //Slider
                Slider(
                  value: (_currentStrength ?? user_data.strength!).toDouble(),
                  activeColor:
                      Colors.brown[_currentStrength ?? user_data.strength!],
                  inactiveColor:
                      Colors.brown[_currentStrength ?? user_data.strength!],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  onChanged: (value) => setState(() {
                    _currentStrength = value.round();
                  }),
                ),

                //Update button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await FirestoreDBService(uid: user.uid).updateUserData(
                          _currentSugars ?? user_data.sugars!,
                          _currentName ?? user_data.name!,
                          _currentStrength ?? user_data.strength!);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Update"),
                ),
              ],
            ),
          );
        });
  }
}
