import 'package:fitness_app/Pages/DailyReport.dart';
import 'package:fitness_app/Pages/FoodLog.dart';
import 'package:fitness_app/Pages/WorkoutLog.dart';
import 'package:fitness_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigatePages extends StatefulWidget {
  @override
  _NavigatePagesState createState() => _NavigatePagesState();
}

class _NavigatePagesState extends State<NavigatePages> {
  int currentPage = 1;
  List<Widget> pages = [WorkoutLog(), DailyReport(), LogFood()];
  final swipePages = PageController(
    initialPage: 1,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: swipePages,
        children: pages,
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue[500],
        currentIndex: 1,
        onTap: switchPage,
        items: [
          BottomNavigationBarItem(
            title: Text("Workouts",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            icon: Icon(MdiIcons.dumbbell, size: 30, color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: Text("Daily Report",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            icon: Icon(MdiIcons.account, size: 30, color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: Text("Food",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            icon: Icon(MdiIcons.foodDrumstick, size: 30, color: Colors.white),
          )
        ],
      ),
    );
  }
  // This functions allows for the BottomNavigationBar and PageView to be in sync
  void switchPage(int index) {
    setState(() {
      currentPage = index;
    });
    swipePages.jumpToPage(index);
  }
}
