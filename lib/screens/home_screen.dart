import 'package:flutter/material.dart';
import 'package:ui_tutorial/screens/day_tile.dart';

class Home extends StatelessWidget {

  List<String> days =["Sunday", "Monday", "Tuesday", "Wednesday",
    "Thursday", "Friday", "Saturday"];
  @override
  Widget build(BuildContext context) {
    print("context call 1");
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Practice"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: days.length,
            itemBuilder: (context, index){
          return DaysTile(text:days[index]);
        }),
      ),
    );
  }
}
