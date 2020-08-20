import 'package:flutter/material.dart';
import 'package:fitness_app/functions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CalorieTracker extends StatefulWidget {
  @override
  _CalorieTrackerState createState() => _CalorieTrackerState();
}

class _CalorieTrackerState extends State<CalorieTracker> {
  //Global Variables

  //Total macros consumed as of that day
  var totalCal = 0;
  var totalCarbs = 0;
  var totalProtein = 0;
  var totalFats = 0;

  //Scroll when there are alot of food entries
  final scroll = ScrollController();

  //List of Food Entries
  final listCards = [];

  //These variables are for when user enter for 'Adding Food Entry'
  var getName = TextEditingController();
  var getNumOfServings = TextEditingController();
  var getCalories = TextEditingController();
  var getCarbs = TextEditingController();
  var getProtein = TextEditingController();
  var getFats = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Bottom App Bar
      bottomNavigationBar: BuildBottomAppBar(),
      body: SafeArea(
        child: Scrollbar(
          isAlwaysShown: true,
          controller: scroll,
          child: ListView(
            children: <Widget>[
              //This first Widget shows the user the total number Calories, Carbs, Protein, Fats that were consumed
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[600],
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 9),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        'Calories',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Text(
                      totalCal.toString(),
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('Carbs', style: TextStyle(fontSize: 25),),
                            Text(totalCarbs.toString(), style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Protein', style: TextStyle(fontSize: 25),),
                            Text(totalProtein.toString(), style: TextStyle(fontSize: 20),)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('Fats', style: TextStyle(fontSize: 25),),
                            Text(totalFats.toString(), style: TextStyle(fontSize: 20),)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    child: new ListView.builder(
                      controller: scroll,
                      shrinkWrap: true,
                      itemCount: listCards.length,
                      itemBuilder: (BuildContext context, int i) {
                        //Builds the Cards
                        return new Card(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                isThreeLine: true,
                                title: Text('${listCards[i].name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                subtitle: Text(
                                    'Total Calories: ${listCards[i].totalCalories}\nServing Size: ${listCards[i].servings}', style: TextStyle(fontSize: 15),),
                                trailing: Text(
                                    'Carbs: ${listCards[i].carbs} | Protein: ${listCards[i].protein} | Fats: ${listCards[i].fats}', style: TextStyle(fontSize: 15),),
                                onLongPress: () {
                                  // When user long presses the FoodEntry, it prompts an Alert to ask if they are sure they want to delete the food entry
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Delete Entry'),
                                        content: Container(
                                            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
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
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('No'),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    RaisedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        var temp = listCards.removeAt(i);
                                                        // Removes the marcros/cals from total consumed
                                                        totalCal -= temp.totalCalories;
                                                        totalCarbs -=
                                                            temp.carbs;
                                                        totalProtein -=
                                                            temp.protein;
                                                        totalFats -= temp.fats;

                                                        setState(() {
                                                          CalorieTracker();
                                                        });
                                                      },
                                                      child: Text('Yes'),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )),
                                      );
                                    },
                                  );
                                },
                                onTap: () {
                                  //When user taps on card, they can edit the values if needed
                                  //This is not efficient, need another way to do this but this will do it

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        var tempName = TextEditingController(text: listCards[i].name); 
                                        var tempServings = TextEditingController(text: listCards[i].servings.toString());
                                        var tempCalories = TextEditingController(text: listCards[i].calories.toString());
                                        var tempCarbs = TextEditingController(text: listCards[i].carbs.toString());
                                        var tempProtein = TextEditingController(text: listCards[i].protein.toString());
                                        var tempFats = TextEditingController(text: listCards[i].fats.toString());

                                        totalCal -= (int.parse(
                                                  tempServings.text) *
                                              int.parse(tempCalories.text));
                                          totalProtein -=
                                              int.parse(tempProtein.text);
                                          totalCarbs -=
                                              int.parse(tempCarbs.text);
                                          totalFats -= int.parse(tempFats.text);

                                        return AlertDialog(
                                          title: Text("Add Food"),
                                          content: SingleChildScrollView(
                                              child: Column(children: <Widget>[
                                            Text('Name'),
                                            TextField(controller: tempName),
                                            Text('Number of Servings'),
                                            TextField(controller: tempServings, keyboardType: TextInputType.number),
                                            Text('Calories'),
                                            TextField(controller: tempCalories, keyboardType: TextInputType.number),
                                            Text('Carbs'),
                                            TextField(controller: tempCarbs, keyboardType: TextInputType.number),
                                            Text('Protein'),
                                            TextField(controller: tempProtein, keyboardType: TextInputType.number),
                                            Text('Fats'),
                                            TextField(controller: tempFats, keyboardType: TextInputType.number),
                                            RaisedButton(
                                              child: Text('Done'),
                                              onPressed: () {
                                                listCards[i].name = tempName.text;
                                                
                                                listCards[i].servings = int.parse(tempServings.text);
                                                listCards[i].calories = int.parse(tempCalories.text);
                                                listCards[i].carbs = int.parse(tempCarbs.text);
                                                listCards[i].protein = int.parse(tempProtein.text);
                                                listCards[i].fats = int.parse(tempFats.text);
                                                listCards[i].totalCalories = (int.parse(tempServings.text) *int.parse(tempCalories.text));

                                                totalCal += (int.parse(
                                                  tempServings.text) *
                                              int.parse(tempCalories.text));
                                          totalProtein +=
                                              int.parse(tempProtein.text);
                                          totalCarbs +=
                                              int.parse(tempCarbs.text);
                                          totalFats += int.parse(tempFats.text);
                                                //Clears the TextField After Submission
                                                tempServings.clear();
                                                tempCalories.clear();
                                                tempCarbs.clear();
                                                tempProtein.clear();
                                                tempFats.clear();
                                                tempName.clear();
                                                //Exits out of AlertDialog
                                                Navigator.pop(context);

                                                //Rebuild App
                                                setState(() {
                                                  CalorieTracker();
                                              });
                                            })
                                          ],),),
                                        );
                                      });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              //Creating a Food Entry
              Card(
                elevation: 10,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        // Need to find a way to make this into a function
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Add Food"),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      // Assigns the user input to a variable
                                      Text('Name'),
                                      TextField(controller: getName,),
                                      Text('Number of Servings'),
                                      TextField(controller: getNumOfServings, keyboardType: TextInputType.number),
                                      Text('Calories'),
                                      TextField(controller: getCalories, keyboardType: TextInputType.number),
                                      Text('Carbs'),
                                      TextField(controller: getCarbs, keyboardType: TextInputType.number),
                                      Text('Protein'),
                                      TextField(controller: getProtein, keyboardType: TextInputType.number),
                                      Text('Fats'),
                                      TextField(controller: getFats, keyboardType: TextInputType.number),
                                      RaisedButton(
                                        onPressed: () {
                                          //Creates a Food Object so a Card can be constructed
                                          //listCards.add(
                                            //Gets the user entered submissions, converts to int if the variable is not getName
                                            // Food(
                                            //     getName.text,
                                            //     int.parse(
                                            //         getNumOfServings.text),
                                            //     int.parse(getCalories.text),
                                            //     int.parse(getCarbs.text),
                                            //     int.parse(getProtein.text),
                                            //     int.parse(getFats.text),
                                            //     (int.parse(
                                            //             getNumOfServings.text) *
                                            //         int.parse(
                                            //             getCalories.text))),
                                          //);
                                          // Adds macros to total

                                          totalCal += (int.parse(
                                                  getNumOfServings.text) *
                                              int.parse(getCalories.text));
                                          totalProtein +=
                                              int.parse(getProtein.text);
                                          totalCarbs +=
                                              int.parse(getCarbs.text);
                                          totalFats += int.parse(getFats.text);

                                          //Clears the TextField After Submission
                                          getNumOfServings.clear();
                                          getCalories.clear();
                                          getCarbs.clear();
                                          getProtein.clear();
                                          getFats.clear();
                                          getName.clear();
                                          //Exits out of AlertDialog
                                          Navigator.pop(context);

                                          //Rebuild App
                                          setState(() {
                                            CalorieTracker();
                                          });
                                        },
                                        child: Text('Add'),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      leading: Icon(Icons.add, size: 50),
                      title: Text('Add Entry'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
