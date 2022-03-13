import 'package:untitled/db-controller.dart';
import 'dart:math';

class TodoList {
  late List<Task> tasks = [];
  Future<Task> addTask(String text, DateTime? time) async {
    var task = Task(text: text, id: -1, time: time);
    var id = await db.addInTable(task);
    task.id = id;
    tasks.add(task);
    return task;
  }
  void removeTask(int id) {
  tasks.removeWhere((x) => x.id == id);
    db.deleteInTable(id);
  }
  void initTask(String text, int id, DateTime? time, bool isCheck) {
    var task = Task(text: text, id: id, time: time, isCheck: isCheck);
    tasks.add(task);
  }
  void toggleTask(int targetIndex) {
    tasks[targetIndex].isCheck = !tasks[targetIndex].isCheck;
    db.updateTask(tasks[targetIndex]);
  }
  int getTaskLen() {
    return tasks.length;
  }
}


class Task{
  Task({required this.text, required this.id, this.time, this.isCheck = false});
  int id;
  String text;
  DateTime? time;
  bool isCheck = false;
  Map<String, dynamic> toMap() => {
    "id": id,
    "text": text,
    "isCheck": isCheck,
    "time": time,
  };
}

