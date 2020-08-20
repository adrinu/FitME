import 'package:fitness_app/functions.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'globals.dart';

class LogFood extends StatefulWidget {
  @override
  _LogFoodState createState() => _LogFoodState();
}

class _LogFoodState extends State<LogFood> {
  final formKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BuildBottomAppBar(),
      // Users can add a food
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        backgroundColor: Colors.lightBlue[500],
        // Add Food Entry
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext content) {
              return AlertDialog(
                title: Text(
                  'Add Food',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.4,
                ),
                scrollable: true,
                content: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Name
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: 'Name'),
                        controller: getName,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a name';
                          }
                          return null;
                        },
                      ),
                      // Calories
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Calories :',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                width: 75,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: getCal,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter a value';
                                    }
                                    if (int.parse(value) < 0) {
                                      return 'Must be a positive integer';
                                    }
                                    return null;
                                  },
                                ))
                          ]),
                      // # of Servings
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Number of Servings:',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                width: 75,
                                child: TextFormField(
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.number,
                                  controller: getServings,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter a value';
                                    }
                                    if (int.parse(value) < 0) {
                                      return 'Must be a positive integer';
                                    }
                                    return null;
                                  },
                                ))
                          ]),
                      // Carbs
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Carbohydrates:',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                width: 75,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: getCarbs,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter a value';
                                    }
                                    if (int.parse(value) < 0) {
                                      return 'Must be a positive integer';
                                    }
                                    return null;
                                  },
                                ))
                          ]),
                      // Protein
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Protein:',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                width: 75,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: getProtein,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter a value';
                                    }
                                    if (int.parse(value) < 0) {
                                      return 'Must be a positive integer';
                                    }
                                    return null;
                                  },
                                ))
                          ]),
                      // Fats
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fats:',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                                width: 75,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: getFats,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter a value';
                                    }
                                    if (int.parse(value) < 0) {
                                      return 'Must be a positive integer';
                                    }
                                    return null;
                                  },
                                ))
                          ]),
                      // Add Food Entry Button
                      RaisedButton(
                        color: Colors.lightBlue[400],
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1.5),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            //Builds a card to display the Nutrition Facts
                            foodEntries.add(
                              NutritionInfo(
                                  getName.text,
                                  int.parse(getCal.text),
                                  int.parse(getServings.text),
                                  int.parse(getCarbs.text),
                                  int.parse(getProtein.text),
                                  int.parse(getFats.text)),
                            );
                            // Adds value to total
                            totalCalories += int.parse(getCal.text) *
                                int.parse(getServings.text);
                            totalServings += int.parse(getServings.text);
                            totalCarbs += int.parse(getCarbs.text);
                            totalProtein += int.parse(getProtein.text);
                            totalFats += int.parse(getFats.text);
                            //Clears TextField entries
                            getName.clear();
                            getCal.clear();
                            getServings.clear();
                            getCarbs.clear();
                            getProtein.clear();
                            getFats.clear();

                            //Re-builds the page
                            Navigator.pop(context);
                            setState(() {
                              LogFood();
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      body: SafeArea(
        child: Scrollbar(
          child: ListView(
            children: <Widget>[
              // Displays info on user's total Calories, Carbs, Protein, Fats consumed
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 220,
                width: double.maxFinite,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text(
                        'Calories',
                        style: TextStyle(fontSize: 35, fontFamily: 'Comfortaa'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$totalCalories',
                        style: TextStyle(fontSize: 30, fontFamily: 'Comfortaa'),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Carbs',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Comfortaa'),
                          ),
                          Text(
                            'Protein',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Comfortaa'),
                          ),
                          Text(
                            'Fats',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Comfortaa'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '$totalCarbs',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Comfortaa'),
                          ),
                          Text(
                            '$totalProtein',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Comfortaa'),
                          ),
                          Text(
                            '$totalFats',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Comfortaa'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // Displays nutritonal facts about the food that was entered
              Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: scroll,
                          itemCount: foodEntries.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              height: 125,
                              width: double.maxFinite,
                              child: Card(
                                elevation: 10,
                                child: InkWell(
                                  // When user long presses the FoodEntry, it prompts an Alert to ask if they are sure they want to delete the food entry
                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Delete Entry'),
                                          content: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 5, 10, 0),
                                              height: 100,
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                      'Are you sure you want to delete this food entry?'),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      RaisedButton(
                                                        child: Text('No'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      RaisedButton(
                                                        child: Text('Yes'),
                                                        onPressed: () {
                                                          totalCalories -=
                                                              foodEntries[i]
                                                                      .calories *
                                                                  foodEntries[i]
                                                                      .servings;
                                                          totalCarbs -=
                                                              foodEntries[i]
                                                                  .carbs;
                                                          totalProtein -=
                                                              foodEntries[i]
                                                                  .protein;
                                                          totalFats -=
                                                              foodEntries[i]
                                                                  .fats;
                                                          Navigator.pop(
                                                              context);
                                                          foodEntries
                                                              .removeAt(i);
                                                          setState(() {
                                                            LogFood();
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )),
                                        );
                                      },
                                    );
                                  },
                                  // When user taps the FoodEntry, it prompts an Alert to edit the values
                                  onTap: () {
                                    var tempName = TextEditingController(
                                      text: foodEntries[i].name,
                                    );
                                    var tempServings = TextEditingController(
                                      text: foodEntries[i].servings.toString(),
                                    );
                                    var tempCalories = TextEditingController(
                                      text: foodEntries[i].calories.toString(),
                                    );
                                    var tempCarbs = TextEditingController(
                                      text: foodEntries[i].carbs.toString(),
                                    );
                                    var tempProtein = TextEditingController(
                                      text: foodEntries[i].protein.toString(),
                                    );
                                    var tempFats = TextEditingController(
                                      text: foodEntries[i].fats.toString(),
                                    );

                                    totalCalories -=
                                        (int.parse(tempServings.text) *
                                            int.parse(tempCalories.text));
                                    totalProtein -= int.parse(tempProtein.text);
                                    totalCarbs -= int.parse(tempCarbs.text);
                                    totalFats -= int.parse(tempFats.text);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Edit Nutritional Values',
                                              textAlign: TextAlign.center,
                                              textScaleFactor: 1.4,
                                            ),
                                            scrollable: true,
                                            content: Form(
                                              key: editFormKey,
                                              child: Column(
                                                children: [
                                                  // Name
                                                  TextFormField(
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                        hintText: 'Name'),
                                                    controller: tempName,
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Enter a name';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                  // Calories
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Calories :',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                          ),
                                                        ),
                                                        Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(0, 10,
                                                                    0, 5),
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  tempCalories,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  return 'Enter a value';
                                                                }
                                                                if (int.parse(
                                                                        value) <
                                                                    0) {
                                                                  return 'Must be a positive integer';
                                                                }
                                                                return null;
                                                              },
                                                            ))
                                                      ]),
                                                  // # of Servings
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Number of Servings:',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                          ),
                                                        ),
                                                        Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(0, 10,
                                                                    0, 5),
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  tempServings,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  return 'Enter a value';
                                                                }
                                                                if (int.parse(
                                                                        value) <
                                                                    0) {
                                                                  return 'Must be a positive integer';
                                                                }
                                                                return null;
                                                              },
                                                            ))
                                                      ]),
                                                  // Carbs
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Carbohydrates:',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                          ),
                                                        ),
                                                        Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(0, 10,
                                                                    0, 5),
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  tempCarbs,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  return 'Enter a value';
                                                                }
                                                                if (int.parse(
                                                                        value) <
                                                                    0) {
                                                                  return 'Must be a positive integer';
                                                                }
                                                                return null;
                                                              },
                                                            ))
                                                      ]),
                                                  // Protein
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Protein:',
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                          ),
                                                        ),
                                                        Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(0, 10,
                                                                    0, 5),
                                                            width: 50,
                                                            child:
                                                                TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  tempProtein,
                                                              validator:
                                                                  (value) {
                                                                if (value
                                                                    .isEmpty) {
                                                                  return 'Enter a value';
                                                                }
                                                                if (int.parse(
                                                                        value) <
                                                                    0) {
                                                                  return 'Must be a positive integer';
                                                                }
                                                                return null;
                                                              },
                                                            ))
                                                      ]),
                                                  // Fats
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Fats:',
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                0, 10, 0, 20),
                                                        width: 50,
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller: tempFats,
                                                          validator: (value) {
                                                            if (value.isEmpty) {
                                                              return 'Enter a value';
                                                            }
                                                            if (int.parse(
                                                                    value) <
                                                                0) {
                                                              return 'Must be a positive integer';
                                                            }
                                                            return null;
                                                          },
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  // Add Food Entry Button
                                                  RaisedButton(
                                                    color:
                                                        Colors.lightBlue[400],
                                                    child: Text(
                                                      'DONE',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          letterSpacing: 1.5),
                                                    ),
                                                    onPressed: () {
                                                      if (editFormKey
                                                          .currentState
                                                          .validate()) {
                                                        //Edits the card to display the changed Nutrition Facts

                                                        foodEntries[i].name =
                                                            tempName.text;
                                                        foodEntries[i]
                                                                .servings =
                                                            int.parse(
                                                                tempServings
                                                                    .text);
                                                        foodEntries[i]
                                                                .calories =
                                                            int.parse(
                                                                tempCalories
                                                                    .text);
                                                        foodEntries[i].carbs =
                                                            int.parse(
                                                                tempCarbs.text);
                                                        foodEntries[i].protein =
                                                            int.parse(
                                                                tempProtein
                                                                    .text);
                                                        foodEntries[i].fats =
                                                            int.parse(
                                                                tempFats.text);

                                                        totalCalories +=
                                                            (int.parse(
                                                                    tempServings
                                                                        .text) *
                                                                int.parse(
                                                                    tempCalories
                                                                        .text));
                                                        totalProtein +=
                                                            int.parse(
                                                                tempProtein
                                                                    .text);
                                                        totalCarbs += int.parse(
                                                            tempCarbs.text);
                                                        totalFats += int.parse(
                                                            tempFats.text);

                                                        //Clears TextField entries
                                                        tempServings.clear();
                                                        tempCalories.clear();
                                                        tempCarbs.clear();
                                                        tempProtein.clear();
                                                        tempFats.clear();
                                                        tempName.clear();

                                                        //Re-builds the page
                                                        Navigator.pop(context);
                                                        setState(() {
                                                          LogFood();
                                                        });
                                                      }
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Column(
                                    children: [
                                      //Name
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 2),
                                        child: Text(
                                          foodEntries[i].name,
                                          style: TextStyle(fontSize: 22),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 0, 0),
                                                child: Text(
                                                  'Total Calories: ' +
                                                      ((foodEntries[i]
                                                                  .servings *
                                                              foodEntries[i]
                                                                  .calories)
                                                          .toString()),
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 16.5),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 0, 0),
                                                child: Text(
                                                  'Calories: ' +
                                                      foodEntries[i]
                                                          .calories
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 16.5),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 0, 0),
                                                child: Text(
                                                  'Servings: ' +
                                                      foodEntries[i]
                                                          .servings
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 16.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 8, 0),
                                                child: Text(
                                                  'Carbs: ' +
                                                      foodEntries[i]
                                                          .carbs
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 16.5),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 8, 0),
                                                child: Text(
                                                  'Protein: ' +
                                                      foodEntries[i]
                                                          .protein
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 16.5),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 8, 0),
                                                child: Text(
                                                  'Fats: ' +
                                                      foodEntries[i]
                                                          .fats
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 16.5),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}