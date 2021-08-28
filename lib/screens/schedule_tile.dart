import 'dart:async';

import 'package:flutter/material.dart';

class ScheduleTile extends StatelessWidget {
  String time = "6:00 PM";
  TextStyle myStyle = TextStyle(color: Color(0xE8D2D2D4));
  int index;
  StreamController tempController;
  ScheduleTile(this.index, this.tempController);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("Start time", style: myStyle,),
        Text("End time", style: myStyle,)
      ],),

      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(time),
        Text(time)],),

      trailing: GestureDetector(
          onTap: (){
            tempController.sink.add(index);
          },
          child: Icon(Icons.remove_circle, color: Colors.red,)),

    );
  }
}
