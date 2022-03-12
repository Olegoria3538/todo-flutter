import 'package:untitled/db-controller.dart';
import 'dart:math';

int getRandomId () {
  Random random = new Random();
  return random.nextInt(10000000);
}

class TodoList {
  late List<Task> tasks = [];
  void addTask(String text, DateTime? time) {
    var id = getRandomId();
    var task = Task(text: text, id: id, time: time);
    tasks.add(task);
    db.addInTable("Todo", id, text);
  }
  void toggleTask(int targetIndex) {
    tasks[targetIndex].isCheck = !tasks[targetIndex].isCheck;
  }
  int getTaskLen() {
    return tasks.length;
  }
}


class Task{
  Task({required this.text, required this.id, this.time});
  int id;
  String text;
  DateTime? time;
  bool isCheck = false;
}

