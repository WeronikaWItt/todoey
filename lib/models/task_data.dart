import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  String editedTaskTitle;
  String editedTaskDescription;

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks.where((todo) => todo.isDone == false).toList();
  List<Task> get tasksCompleted => _tasks.where((todo) => todo.isDone == true).toList();

  int get taskCount {
    return _tasks.length;
  }

  String getTitle(int index) {
    return _tasks[index].taskTitle;
  }

  String getDescription(int index) {
    return _tasks[index].description;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(Task todo, String title, String description) {
    todo.taskTitle = title;
    todo.description = description;

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
