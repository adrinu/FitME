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
  // Validates the name of Food when adding/editing entry
  String nameValidator(String name) {
    if (name.isEmpty) {
      return 'Enter a name';
    }
    return null;
  }

  // Validates the number entered (No negatives/spaces)
  String numValidator(String number) {
    if (number.isEmpty) {
      return 'Enter a value';
    }

    if (number.contains(' ')) {
      return 'Invalid value';
    }

    if (int.parse(number) < 0) {
      return 'Invalid value';
    }
    return null;
  }

  // Subtracts the Calories and macronutrients from the total based on the card
  void subtractMacros(i) {
    totalCalories -= foodEntries[i].calories * foodEntries[i].servings;
    totalCarbs -= foodEntries[i].carbs * foodEntries[i].servings;
    totalProtein -= foodEntries[i].protein * foodEntries[i].servings;
    totalFats -= foodEntries[i].fats * foodEntries[i].servings;
  }
  // Adds the Calories and macronutrients to the total
  void addToTotal(cal, servings, carbs, protein, fats) {
    totalCalories += (int.parse(cal) * int.parse(servings));
    totalServings += int.parse(servings);
    totalCarbs += (int.parse(carbs) * int.parse(servings));
    totalProtein += (int.parse(protein) * int.parse(servings));
    totalFats += (int.parse(fats) * int.parse(servings));
  }
  // Subtracts the Calories and macronutrients from the total
  void subFromTotal(cal, servings, carbs, protein, fats) {
    totalCalories -= (int.parse(cal) * int.parse(servings));
    totalServings -= int.parse(servings);
    totalCarbs -= (int.parse(carbs) * int.parse(servings));
    totalProtein -= (int.parse(protein) * int.parse(servings));
    totalFats -= (int.parse(fats) * int.parse(servings));
  }
