import 'package:flutter/material.dart';
import 'package:practicefirebase/screens/secondpage/secondpage.dart';
import 'package:practicefirebase/screens/wrapper.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Wrapper());

      case "/second":
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => SecondPage(data: args),
          );
        } else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Error"),
        ),
      ),
    );
  }
}
