import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:practicefirebase/models/user.dart';
import 'package:practicefirebase/services/FirestoreDb.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _controllerName = TextEditingController();
  final _controllerAge = TextEditingController();
  final _controllerDate = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(6),
          children: [
            const SizedBox(height: 5.0),
            TextFormField(
              controller: _controllerName,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return "Enter Name";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: _controllerAge,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return "Enter Age";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Age",
              ),
            ),
            const SizedBox(height: 10.0),
            DateTimeField(
              controller: _controllerDate,
              validator: (value) {
                if (value.toString().isEmpty) {
                  return "Enter birthday";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Birthday",
                border: OutlineInputBorder(),
              ),
              format: DateFormat("yyyy-MM-dd"),
              onShowPicker: (context, currentValue) => showDatePicker(
                context: context,
                initialDate: currentValue ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final user = User(
                    name: _controllerName.text.trim(),
                    age: int.parse(_controllerAge.text.trim()),
                    birthday: _controllerDate.text.toString().trim(),
                  );

                  await FirestoreDb().createUser(user);
                  Navigator.pop(context);
                }
              },
              child: const Text("Create"),
            )
          ],
        ),
      ),
    );
  }
}
