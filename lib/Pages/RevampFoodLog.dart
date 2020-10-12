import 'package:flutter/material.dart';
import 'package:fitness_app/functions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FoodLog extends StatefulWidget {
  @override
  _FoodLogState createState() => _FoodLogState();
}

class _FoodLogState extends State<FoodLog> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<Widget> foodEntries = [];

  ScrollController scroll;
  int count = 0;
  List<Food> foods = [];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    void onEditVar(int val, Food newfood) {
      setState(() {
        foods.removeAt(val);
        foods.insert(val, newfood);
      });
    }

    Function(int) onDeleteVar = (int val) {
      setState(() {
        foods.removeAt(val);
        count--;
        foodEntries.removeAt(val);
      });
    };

    foodEntries = List<FoodCard>.generate(
      count,
      (int index) => FoodCard(
        index: index,
        onDelete: onDeleteVar,
        onEdit: onEditVar,
        aFood: foods[index],
        count: count,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      /* Adds a Food Card */
      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        backgroundColor: Colors.lightBlue[500],
        onPressed: () {
          addFood(context);
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /* Display Overall calories, fats, protein, carbs */
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 220,
                  width: double.maxFinite,
                  child: Card(
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          'Calories',
                          style: TextStyle(fontSize: 35, fontFamily: 'Varela'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          getCaloriesFromEntry().toString(),
                          style: TextStyle(fontSize: 30, fontFamily: 'Varela'),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Carbs',
                              style:
                                  TextStyle(fontSize: 25, fontFamily: 'Varela'),
                            ),
                            Text(
                              'Protein',
                              style:
                                  TextStyle(fontSize: 25, fontFamily: 'Varela'),
                            ),
                            Text(
                              'Fats',
                              style:
                                  TextStyle(fontSize: 25, fontFamily: 'Varela'),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              getCarbsFromEntry().toString(),
                              style:
                                  TextStyle(fontSize: 25, fontFamily: 'Varela'),
                            ),
                            Text(
                              getProteinFromEntry().toString(),
                              style:
                                  TextStyle(fontSize: 25, fontFamily: 'Varela'),
                            ),
                            Text(
                              getFatsFromEntry().toString(),
                              style:
                                  TextStyle(fontSize: 25, fontFamily: 'Varela'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            /* Displaying the FoodCards */
            SliverFixedExtentList(
                itemExtent: 150,
                delegate: SliverChildListDelegate(
                  foodEntries,
                ))
          ],
        ),
      ),
    );
  }

  /* 
  Creates an AlertDialog and allows users
  to input info about Food, then creates a FoodCard
  */
  void addFood(context) {
    final formKey = GlobalKey<FormState>();

    var getName = TextEditingController();
    var getCal = TextEditingController();
    var getServings = TextEditingController();
    var getCarbs = TextEditingController();
    var getProtein = TextEditingController();
    var getFats = TextEditingController();

    void _dispose() {
      getName.dispose();
      getCal.dispose();
      getServings.dispose();
      getCarbs.dispose();
      getProtein.dispose();
      getFats.dispose();
    }

    showDialog(
      context: context,
      builder: (BuildContext content) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            'Add Food',
            textAlign: TextAlign.center,
            textScaleFactor: 1.4,
          ),
          content: Form(
            key: formKey,
            child: Column(
              children: [
                /* Name */
                TextFormField(
                  controller: getName,
                  textAlign: TextAlign.center,
                  validator: nameValidator,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                /* Calories */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Calories :',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      width: 75,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        controller: getCal,
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* Num of servings */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Number of Servings:',
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
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* Carbs */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Carbohydrates:',
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
                        controller: getCarbs,
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* Protein */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Protein:',
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
                        controller: getProtein,
                        validator: numValidator,
                      ),
                    )
                  ],
                ),
                /* Fats */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fats:',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      width: 75,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        controller: getFats,
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* ADD */
                RaisedButton(
                  color: Colors.lightBlue[400],
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
                  ),
                  onPressed: () {
                    Food temp = Food(
                      getName.text,
                      num.parse(getCal.text),
                      num.parse(getServings.text),
                      num.parse(getCarbs.text),
                      num.parse(getProtein.text),
                      num.parse(getFats.text),
                    );
                    setState(() {
                      foods.insert(foods.length, temp);
                    });
                    count += 1;
                    Navigator.pop(context);
                    _dispose();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /* Gets calories from All Entries*/
  num getCaloriesFromEntry() {
    num cal = 0;
    for (var i = 0; i < foods.length; ++i) {
      cal += foods[i].totalCalories();
    }
    return cal;
  }

  /* Gets Carbs from All Entries*/
  num getCarbsFromEntry() {
    num car = 0;
    for (var i = 0; i < foods.length; ++i) {
      car += foods[i].totalCarbs();
    }
    return car;
  }

  /* Gets Protein from All Entries*/
  num getProteinFromEntry() {
    num pro = 0;
    for (var i = 0; i < foods.length; ++i) {
      pro += foods[i].totalProtein();
    }
    return pro;
  }

  /* Gets Fats from All Entries*/
  num getFatsFromEntry() {
    num f = 0;
    for (var i = 0; i < foods.length; ++i) {
      f += foods[i].totalFats();
    }
    return f;
  }
}

class FoodCard extends StatefulWidget {
  final int index;
  final Function(int) onDelete;
  final Function(int, Food) onEdit;
  final int count;

  final Food aFood;

  FoodCard(
      {this.index, Key key, this.aFood, this.count, this.onDelete, this.onEdit})
      : super(key: key);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      width: double.maxFinite,
      height: 125,
      child: Card(
        elevation: 10,
        child: InkWell(
          /* On Tap: Edits value of FoodCard */
          onTap: () {
            editFood(context);
          },
          /* On Long Press: Deletes FoodCard */
          onLongPress: () {
            displayDeleteEntry(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* Name */
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                child: Text(widget.aFood.name, style: TextStyle(fontSize: 30)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /* Cals */
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                "Calories: " +
                                    widget.aFood.totalCalories().toString(),
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 20),
                              ),
                            ),
                            /* Servings */
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                              child: Text(
                                "Servings: " + widget.aFood.servings.toString(),
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 20),
                              ),
                            ),
                          ]),
                      //SizedBox(width: 165),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /* Carbs*/
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              "Carbs: " + widget.aFood.totalCarbs().toString(),
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 20),
                            ),
                          ),
                          /* Protein */
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              "Protein: " +
                                  widget.aFood.totalProtein().toString(),
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 20),
                            ),
                          ),
                          /* Fats */
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              "Fats: " + widget.aFood.totalFats().toString(),
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editFood(context) {
    final formKey = GlobalKey<FormState>();

    var getName = TextEditingController(text: widget.aFood.name);
    var getCal = TextEditingController(text: widget.aFood.calories.toString());
    var getServings =
        TextEditingController(text: widget.aFood.servings.toString());
    var getCarbs = TextEditingController(text: widget.aFood.carbs.toString());
    var getProtein =
        TextEditingController(text: widget.aFood.protein.toString());
    var getFats = TextEditingController(text: widget.aFood.fats.toString());

    void _dispose() {
      getName.dispose();
      getCal.dispose();
      getServings.dispose();
      getCarbs.dispose();
      getProtein.dispose();
      getFats.dispose();
    }

    showDialog(
      context: context,
      builder: (BuildContext content) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            'Edit Food info',
            textAlign: TextAlign.center,
            textScaleFactor: 1.4,
          ),
          content: Form(
            key: formKey,
            child: Column(
              children: [
                /* Name */
                TextFormField(
                  controller: getName,
                  textAlign: TextAlign.center,
                  validator: nameValidator,
                  decoration: InputDecoration(hintText: "Name"),
                ),
                /* Calories */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Calories :',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      width: 75,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        controller: getCal,
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* Num of servings */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Number of Servings:',
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
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* Carbs */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Carbohydrates:',
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
                        controller: getCarbs,
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* Protein */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Protein:',
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
                        controller: getProtein,
                        validator: numValidator,
                      ),
                    )
                  ],
                ),
                /* Fats */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fats:',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      width: 75,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        controller: getFats,
                        validator: numValidator,
                      ),
                    ),
                  ],
                ),
                /* EDIT */
                RaisedButton(
                  color: Colors.lightBlue[400],
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
                  ),
                  onPressed: () {
                    var temp = Food(
                      getName.text,
                      num.parse(getCal.text),
                      num.parse(getServings.text),
                      num.parse(getCarbs.text),
                      num.parse(getProtein.text),
                      num.parse(getFats.text),
                    );
                    setState(() {
                      widget.onEdit(widget.index, temp);
                    });
                    Navigator.pop(context);
                    _dispose();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void displayDeleteEntry(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Entry'),
          content: Container(
            height: 105,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Column(
              children: [
                Text(
                  'Are you sure you want to delete this food entry?',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /* No button */
                    RaisedButton(
                      color: Colors.lightBlue[500],
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    /* Yes button */
                    RaisedButton(
                      color: Colors.lightBlue[500],
                      child: Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                      onPressed: () {
                        widget.onDelete(widget.index);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Food {
  String name;
  num calories;
  num servings;
  num carbs;
  num protein;
  num fats;

  Food(this.name, this.calories, this.servings, this.carbs, this.protein,
      this.fats);

  num totalCalories() {
    return calories * servings;
  }

  num totalCarbs() {
    return carbs * servings;
  }

  num totalProtein() {
    return protein * servings;
  }

  num totalFats() {
    return fats * servings;
  }
}
