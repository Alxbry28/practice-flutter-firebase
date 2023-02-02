import 'package:flutter/material.dart';
import 'package:practicefirebase/shared/constants.dart';

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
  String? _currentStrength;

  @override
  Widget build(BuildContext context) {
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
            decoration: textInputDecoration,
            validator: (value) => value!.isEmpty ? "Please enter a name" : null,
            onChanged: (value) => setState(() {
              _currentName = value;
            }),
          ),
          const SizedBox(height: 20),
          //Dropdown
          DropdownButtonFormField(
            value: _currentSugars ?? "0",
            hint: Text("Select Sugar"),
            items: sugars.map((sugar) => DropdownMenuItem(
                  value: sugar,
                  child: Text("$sugar sugars"),
                )).toList(),
            onChanged: (value) => setState(() {
              _currentSugars = value;
            }),
          ),

          //Slider



          //Update button
          ElevatedButton(
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}
