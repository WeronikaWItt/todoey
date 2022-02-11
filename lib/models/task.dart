class Task {
  String taskTitle;
  String description;
  int id;
  bool isDone;

  Task({this.taskTitle, this.description, this.id, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  Task.fromMap(Map map)
      : this.taskTitle = map['taskTitle'],
        this.description = map['description'],
        this.id = map['id'],
        this.isDone = map['isDone'];

  Map toMap() {
    return {
      'taskTitle': this.taskTitle,
      'description': this.description,
      'id': this.id,
      'isDone': this.isDone,
    };
  }
}
