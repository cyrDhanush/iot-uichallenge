import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_uichallenge/helpers/utils.dart';
import 'package:iot_uichallenge/screens/controlscreen/controlscreen.dart';
import 'package:iot_uichallenge/screens/homepage.dart';
import 'package:iot_uichallenge/trialpage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'poppins',
      ),
      home: ControlScreen(),
    );
  }
}
