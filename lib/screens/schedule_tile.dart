import 'dart:async';

import 'package:flutter/material.dart';

class ScheduleTile extends StatefulWidget {
  int index;
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? selectedTime;
  StreamController tempController;
  ScheduleTile(this.index, this.tempController);

  @override
  State<ScheduleTile> createState() => _ScheduleTileState();
}

class _ScheduleTileState extends State<ScheduleTile> {


  TextStyle myStyle = TextStyle(color: Color(0xE8D2D2D4));

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        GestureDetector(
          onTap: (){
              selectTime(context);
          },
            child: Text("Start time", style: myStyle,)),
        Text("End time", style: myStyle,)
      ],),

      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("${widget.time.hour} : ${widget.time.minute} "),
        Text(widget.time.hour.toString())],),

      trailing: GestureDetector(
          onTap: (){
            widget.tempController.sink.add(widget.index);
          },
          child: Icon(Icons.remove_circle, color: Colors.red,)),

    );
  }

  Future<void> selectTime(BuildContext context) async {
    widget.selectedTime = await showTimePicker(context: context, initialTime: widget.time);
    setState(() {
    widget.time = widget.selectedTime!;
    });
  }
}
