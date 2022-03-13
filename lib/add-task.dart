import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTaskView extends StatelessWidget {
  static const id = "add";
  String text = "";
  final TextEditingController _textController = new TextEditingController();
  DateTime? dateTime = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome view add task"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 20, // to apply margin in the main axis of the wrap
          runSpacing: 20,
          children: [
            TextField(
                onChanged: (x) => {text = x},
                decoration: const InputDecoration(
                  hintText: 'Decription'
              )
            ),
            TextField(
                controller: _textController,
                readOnly: true,
                onTap: () {
                  DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      onConfirm: (date) {
                        dateTime = date;
                        _textController.text = date.toString();
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.ru
                  );
                },
                decoration: const InputDecoration(
                  hintText: 'DateTime'
              )
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
            child:Text("Add task"),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}