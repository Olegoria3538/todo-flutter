import 'package:flutter/material.dart';
import 'package:untitled/todo-list-controller.dart';
import 'package:untitled/db-controller.dart';
import 'add-task.dart';

class AwesomeTodoView extends StatefulWidget {
  static const id = "main";
  const AwesomeTodoView({Key? key}) : super(key: key);
  @override
  State<AwesomeTodoView> createState() => _AwesomeTodoView();
}


class _AwesomeTodoView extends State<AwesomeTodoView> {
  var todo = TodoList();
  void addTask() async {
    var ats = AddTaskView();
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ats;
    }));
    if(ats.text.isNotEmpty) {
      setState(() {
        todo.addTask(ats.text, ats.dateTime);
      });
    }
  }

  void checkTask(int index) {
    getTodoFromDb();
    setState(() {
      todo.toggleTask(index);
    });
  }

  void getTodoFromDb() async {
    var table = await db.getTable('Todo');
    setState(() {
      table.forEach((x) {
        todo.addTask(x["text"], null);
      });
    });
  }

  @override
  void initState() {
    getTodoFromDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome todo"),
      ),
      body:Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(itemCount: todo.getTaskLen(), itemBuilder: (context, i) {
          var el = todo.tasks[i];
          return
                Row(
                  children: [
                    Checkbox(value: el.isCheck, onChanged: (_) => {checkTask(i)}, ),
                    Text(
                      el.text + (el.time != null ? (' (' + el.time.toString() + ')') : ''),
                      style: TextStyle( fontSize: 20 ),
                    )
                  ],
                );
        })
      ),
      persistentFooterButtons: [
        RaisedButton(
          child:Text("Add task"),
          onPressed: addTask,
        )
      ],
    );
  }
}