import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  String editedTaskTitle;
  String editedTaskDescription;

  List<Task> _tasks = [
    // Task(taskTitle: 'Eat', description: 'avocado', id: 0),
    // Task(taskTitle: 'Sleep', description: '8 h', id: 1),
    // Task(taskTitle: 'Repeat', description: 'Dodac task w któym jest długi opis', id: 2),
  ];

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

  void addTask(String newTask, String description, int index) {
    Task task;
    if (description == null) {
      task = Task(taskTitle: newTask, description: description = ' ', id: index++);
    } else {
      task = Task(taskTitle: newTask, description: description, id: index++);
    }
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(String newTitle, String newDescription, int index) {
    if (newTitle == null || newDescription == null) {
      _tasks[index].taskTitle = _tasks[index].taskTitle;
      _tasks[index].description = _tasks[index].description;
    } else {
      _tasks[index].taskTitle = newTitle;
      _tasks[index].description = newDescription;
    }
    print(index);

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
