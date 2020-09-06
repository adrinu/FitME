import 'package:flutter/material.dart';



//Global Variables
String myPassword;
String myEmail;

final signInEmail = TextEditingController();
final signInPassword = TextEditingController();

final signUpEmail = TextEditingController();
final signUpPassword = TextEditingController();
final signUpConfirmPassword = TextEditingController();


var scroll = ScrollController();

var getName = TextEditingController();
var getCal = TextEditingController();
var getServings = TextEditingController();
var getCarbs = TextEditingController();
var getProtein = TextEditingController();
var getFats = TextEditingController();

var totalCalories = 0;
var totalServings = 0;
var totalCarbs = 0;
var totalProtein = 0;
var totalFats = 0;

List foodEntries = [];
List myExercises = [
];
