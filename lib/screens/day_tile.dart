import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_tutorial/screens/schedule_tile.dart';

class DaysTile extends StatelessWidget {

  String text = " ";
  StreamController btnStream = StreamController();
  bool switchValue = false;
  List<int> scheduleTiles = [];
  DaysTile({Key? key, this.text=""}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    StreamTransformer btnStreamTransformer = StreamTransformer.fromHandlers(
        handleData: (data, sink)
        {
          if(data == "schedule added")
          {
            print(data);
            scheduleTiles.add(scheduleTiles.length+1);
            sink.add(data);
          }
          else if(data == true || data == false)
            {
              print("switch turned on or off");
              sink.add(data);
            }
          else {
            print("a schedule is removed from list");
            scheduleTiles.removeAt(data);
            sink.add(data);
          }

        }
    );

    return StreamBuilder(
      stream: btnStream.stream.transform(btnStreamTransformer),
      builder: (context, asyncSnapShot){
        return Column(
          children:
          [
            ListTile(
              leading: Text(text),
              trailing: Switch(
                value: switchValue,
                onChanged: (value){
                  switchValue = value;
                  btnStream.sink.add(value);
                },
              ),
            ),
            switchValue?Column(
              children:[
                Container(
                  height: 180.0,
                  child: ListView.builder(
                      itemCount: scheduleTiles.length,
                      itemBuilder: (context, index){
                        return ScheduleTile(index, btnStream);
                      }) ,
                ),
                TextButton(child: Text("Add Schedlue"), onPressed: (){

                  btnStream.sink.add("schedule added");
                },)
              ]
            ): Container(height: 0,),
          ]

        );
      }
    );
  }
}
