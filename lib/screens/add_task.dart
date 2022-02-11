import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/shared_preferences.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/widgets/cancel_button.dart';

class Add extends StatefulWidget {
  static const ROUTE = '/add';

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  String title;
  String description = '';
  int index = 0;

  @override
  void initState() {
    super.initState();
    title = Prefs.getTitle() ?? ' ';
    description = Prefs.getDescription() ?? ' ';
  }

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
                  Text('New task', textAlign: TextAlign.center, style: kPacificoHeader),
                  SizedBox(
                    height: 15,
                  ),
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
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                        labelText: 'Description',
                      ),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CancelButton(),
                      MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        color: kAccent,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: kLightPurple,
                                content: Text('Task added', style: kSnackBarCinzel),
                              ),
                            );

                            final task = Task(id: index++, taskTitle: title, description: description, isDone: false);

                            Provider.of<TaskData>(context, listen: false).addTask(task);

                            await Prefs.setTitle(title);
                            await Prefs.setDescription(description);

                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('Add', style: kButtonText),
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
