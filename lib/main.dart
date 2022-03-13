import 'dart:ffi';

import 'package:flutter/material.dart';
import 'add-task.dart';
import 'awesom-todo-list-view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AwesomeTodoView(),
      routes: {
        AwesomeTodoView.id: (context) => AwesomeTodoView(),
        AddTaskView.id: (context) => AddTaskView()
      },
    );
  }
}

