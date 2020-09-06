import 'package:flutter/material.dart';

class ArmPage extends StatefulWidget {
  @override
  _ArmPageState createState() => _ArmPageState();
}

class _ArmPageState extends State<ArmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: ListView(
        children: [
          Card(
            child: InkWell(
              onTap: () {}, //Displays Info about how to do the exercise
              child: ListTile(
                title: Text('Tricep Extensions'),
                subtitle: Text('Isolation Movement'),
                trailing: IconButton(icon: Icon(Icons.add), onPressed: () {}),// Adds exercise to workouts
              ),
            ),
          )
        ],
      )),
    );
  }
}
