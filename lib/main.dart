import 'package:fitness_app/Pages/FoodLog.dart';
import 'package:fitness_app/Authencation/SignInPage.dart';
import 'package:fitness_app/Pages/NavigatePages.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/Authencation/SignUpPage.dart';
import 'Authencation/SignUpPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn()
      
    );
  }
}
