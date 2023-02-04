import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practicefirebase/models/user.dart';
import 'package:practicefirebase/screens/auth/authenticate.dart';
import 'package:practicefirebase/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
     


    // print("wrapper: ${user}");
    //Return home or auth widget
  
  

    if (user == null) {
      return Authenticate();
    } else {
      //  return Home();
      if (user.isEmailVerified!) {
        return Home();
      } else {
        return Authenticate();
      }
    }
  }
}
