import 'package:flutter/material.dart';
import 'package:to_do/constants.dart';

class TasksTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String taskDescription;
  final Function checkboxCallback;

  TasksTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.taskDescription});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$taskTitle',
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 23,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        '$taskDescription',
        maxLines: null,
        softWrap: true,
        style: TextStyle(fontSize: 16, fontFamily: 'Cinzel'),
      ),
      trailing: Checkbox(
        activeColor: kAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
