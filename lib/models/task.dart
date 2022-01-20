class Task {
  String taskTitle;
  String description;
  int id;
  bool isDone;

  Task({this.taskTitle, this.description, this.id, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
