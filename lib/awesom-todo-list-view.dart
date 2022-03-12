import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/task.dart';

import 'add-task.dart';

class AwesomeTodoView extends StatefulWidget {
  static const id = "main";
  const AwesomeTodoView({Key? key}) : super(key: key);
  @override
  State<AwesomeTodoView> createState() => _AwesomeTodoView();
}


class _AwesomeTodoView extends State<AwesomeTodoView> {
  var todo = TodoList();
  void addTodo() async {
    var ats = AddTaskView();
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ats;
    }));
    setState(() {
      todo.addTask(ats.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: ListView.builder(itemCount: todo.getTaskLen(), itemBuilder: (context, i) {
        return Text(todo.tasks[i].text);
      }),
      persistentFooterButtons: [
        RaisedButton(
          child:Text("Add task"),
          onPressed: addTodo,
        )
      ],
    );
  }
}