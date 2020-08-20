import 'package:fitness_app/FoodLog.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/SignInPage.dart';
import 'package:fitness_app/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogFood()
    );
  }
}
