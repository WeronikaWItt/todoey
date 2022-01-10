import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  String editedTaskTitle;
  String editedTaskDescription;

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTask, String description) {
    final task = Task(name: newTask, description: description);
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(String newTitle, String newDescription, int index) {
    _tasks[index].name = newTitle;
    _tasks[index].description = newDescription;
    notifyListeners();
  }

  void updateTaskStatus(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
