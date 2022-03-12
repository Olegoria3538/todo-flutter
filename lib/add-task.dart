

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/task.dart';

class AddTaskView extends StatelessWidget {
  static const id = "add";
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Column(
        children: [
          Text("decription"),
          TextField(onChanged: (x) => {text = x}),
          RaisedButton(child:Text("Button"), onPressed: () {
            Navigator.pop(context);
          })
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}