import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/widgets/cancel_button.dart';
import 'package:to_do/widgets/form_widget.dart';

int counter = 0;

class EditTask extends StatefulWidget {
  static const ROUTE = '/edit';

  final Task task;
  final int index;
  const EditTask({this.task, this.index});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();

  String title;
  String description;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 180.0,
        left: 30.0,
        right: 30.0,
      ),
      decoration: BoxDecoration(
        color: kAccent,
        image: DecorationImage(
          image: AssetImage("images/background_full.png"),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            padding: EdgeInsets.only(top: 70.0, left: 30.0, right: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Edit task', textAlign: TextAlign.center, style: kPacificoHeader),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kAccent),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: TextFormField(
                      autocorrect: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Cinzel',
                      ),
                      controller: _controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        labelText: Provider.of<TaskData>(context, listen: false).getTitle(counter++),
                        //labelText: 'New title',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        }
                        return null;
                      },
                      onChanged: (newValue) {
                        title = newValue;
                      },
                    ),
                  ),
                  Divider(),
                  FormWidget(
                    hintText: Provider.of<TaskData>(context, listen: false).getDescription(counter++),
                    changedValue: (newValue) {
                      description = newValue;
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
                          if (_formKey.currentState.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: kAccent,
                                content: Text('Task edited', style: kCinzel),
                              ),
                            );
                            Provider.of<TaskData>(context, listen: false).editTask(title, description, counter++);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('Save changes', style: kButtonText),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
