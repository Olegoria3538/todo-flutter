class TodoList {
  List<Task> tasks = [];
  void addTask(String text, DateTime? time) {
    var task = Task(text: text, time: time);
    tasks.add(task);
  }
  void toggleTask(int targetIndex) {
    tasks[targetIndex].isCheck = !tasks[targetIndex].isCheck;
  }
  int getTaskLen() {
    return tasks.length;
  }
}


class Task{
  Task({required this.text, this.time});
  String text;
  DateTime? time;
  bool isCheck = false;
}
