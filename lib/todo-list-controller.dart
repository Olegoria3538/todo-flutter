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
    db.addInTable(id, text, false, time);
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
  };
}

