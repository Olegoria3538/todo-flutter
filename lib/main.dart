import 'dart:ffi';

import 'package:flutter/material.dart';
import 'add-task.dart';
import 'awesom-todo-list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
