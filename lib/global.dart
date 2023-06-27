import 'package:flutter/material.dart';

// animation details

Curve switchcurve = Curves.fastLinearToSlowEaseIn;
Duration switchduration = Duration(milliseconds: 800);

List<Color> spectrum = [
  Colors.lightBlueAccent,
  Colors.blue,
  Colors.deepPurpleAccent,
  Color(0xffff69b4),
  Colors.pinkAccent,
  Color(0xffff0000),
];

TextStyle smallhead = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
TextStyle smallbody = TextStyle(
  color: Colors.white,
  fontSize: 15,
);
