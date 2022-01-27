import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/edit_task.dart';

import '../constants.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: Key(task.id.toString()),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) => deleteTodo(context, task),
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: buildTodo(context));
  }

  void editTask(BuildContext context, Task task) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTask(task.id),
        ),
      );

  void deleteTodo(BuildContext context, Task task) {
    final provider = Provider.of<TaskData>(context, listen: false);
    provider.deleteTask(task);
  }

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTask(context, task),
        child: SingleChildScrollView(
          child: Card(
            color: Color(0xffFDF9FF),
            elevation: 1,
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${task.taskTitle}'.toLowerCase(),
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 23,
                            decoration: task.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        Text(
                          '${task.description}',
                          style: TextStyle(fontSize: 16, fontFamily: 'Cinzel'),
                        ),
                      ],
                    ),
                  ),
                  Checkbox(
                    activeColor: kAccent,
                    checkColor: Colors.white,
                    value: task.isDone,
                    onChanged: (_) {
                      Provider.of<TaskData>(context, listen: false).updateTaskStatus(task);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
