import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/widgets/task_widget.dart';

class DoneTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context);
    final doneTasks = provider.tasksCompleted;

    return doneTasks.isEmpty
        ? Center(
            child: Text(
              'Nothing completed',
              style: kPacificoHeader,
            ),
          )
        : ListView.builder(
            itemCount: doneTasks.length,
            itemBuilder: (context, index) {
              final task = doneTasks[index];

              return TaskWidget(
                task: task,
              );
            },
          );
  }
}
