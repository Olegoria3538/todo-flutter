import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Task{
  Task({required this.text});
  String text;
  DateTime? time;
  bool isCheck = false;
}
