import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitness_app/FoodLog.dart';
import 'package:fitness_app/globals.dart';

//Classes
class NutritionInfo {
  String name;
  int calories;
  int servings;
  int carbs;
  int protein;
  int fats;

  NutritionInfo(name, calories, servings, carbs, protein, fats) {
    this.name = name;
    this.calories = calories;
    this.servings = servings;
    this.carbs = carbs;
    this.protein = protein;
    this.fats = fats;
  }
}

// Widgets
class BuildBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightBlue[500],
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(MdiIcons.dumbbell, size: 30, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              MdiIcons.account,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(MdiIcons.foodDrumstick, size: 30, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

// Functions
final snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(onPressed: () {}, label: 'Undo'));
