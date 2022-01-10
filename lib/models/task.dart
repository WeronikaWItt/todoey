class Task {
  String name;
  String description;
  String id;
  bool isDone;

  Task({this.name, this.description, this.id, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
