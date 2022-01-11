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

  String getTitle(int index) {
    return _tasks[index].taskTitle;
  }

  String getDescription(int index) {
    return _tasks[index].description;
  }

  void setTitle(String title, int index) {
    _tasks[index].taskTitle = title;
    notifyListeners();
  }

  void addTask(String newTask, String description) {
    final task = Task(taskTitle: newTask, description: description = ' ');
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(String newTitle, String newDescription, int index) {
    _tasks[index].taskTitle = newTitle;
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

class TitleData extends ChangeNotifier {
  String _title;
  set title(String title) {
    _title = title;
    notifyListeners();
  }

  String get title {
    return _title;
  }
}
