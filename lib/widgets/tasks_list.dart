import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/widgets/task_widget.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context);
    final tasks = provider.tasks;
    return tasks.isEmpty
        ? Center(
            child: Text(
              "No tasks",
              style: kPacificoHeader,
            ),
          )
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskWidget(task: task);
            },
          );
  }
}
