import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/edit_task.dart';
import 'package:to_do/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  void editTask(BuildContext context, Task task) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTask(
            //task: task,
            task.id,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Slidable(
              key: Key(task.id.toString()),
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) => taskData.deleteTask(task),
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () => editTask(context, task),
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditTask(task.id))),
                child: TasksTile(
                  taskTitle: task.taskTitle,
                  taskDescription: task.description,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxCallback) {
                    taskData.updateTaskStatus(task);
                  },
                ),
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
