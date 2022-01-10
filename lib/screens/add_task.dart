import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/widgets/cancel_button.dart';
import 'package:to_do/widgets/form_widget.dart';

String newTaskDescription;
String newTaskTitle;

class AddTask extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('New task', textAlign: TextAlign.center, style: kPacificoHeader),
                Divider(),
                FormWidget(
                  hintText: "New title",
                  changedValue: (newValue) {
                    newTaskTitle = newValue;
                  },
                ),
                Divider(),
                FormWidget(
                  hintText: 'New description',
                  changedValue: (newValue) {
                    newTaskDescription = newValue;
                  },
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CancelButton(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      color: kAccent,
                      onPressed: () {
                        Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle, newTaskDescription);
                        Navigator.pop(context);
                      },
                      child: Text('Add', style: kButtonText),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
