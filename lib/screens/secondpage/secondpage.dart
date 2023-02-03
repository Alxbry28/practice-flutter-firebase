import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practicefirebase/models/user.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
     final user = Provider.of<MyUser?>(context);

     print("2ndpage ${user!.uid}");

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Text("This is second page"),
      ),
    );
  }
}
