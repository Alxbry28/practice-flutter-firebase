import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.indigo,
      width: 2.0,
    ),
  ),
);
