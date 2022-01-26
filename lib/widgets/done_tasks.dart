import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/widgets/tasks_tile.dart';

class DoneTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context);
    final dones = provider.tasksCompleted;

    return dones.isEmpty
        ? Center(
            child: Text(
              'Nothing completed',
              style: kPacificoHeader,
            ),
          )
        : ListView.builder(
            itemCount: dones.length,
            itemBuilder: (context, index) {
              final task = dones[index];

              return TasksTile(
                task: task,
              );
            },
          );
  }
}
