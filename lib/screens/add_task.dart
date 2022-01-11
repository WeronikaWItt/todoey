import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/task_screen.dart';
import 'package:to_do/widgets/cancel_button.dart';
import 'package:to_do/widgets/form_widget.dart';

class Add extends StatefulWidget {
  static const ROUTE = '/add';

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  String title;
  String description;
  String taskTitle = '';
  SharedPreferences prefs;

  @override
  void initState() {
    setup();
    super.initState();
  }

  void setup() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      taskTitle = prefs.getString('taskTitle');
    });
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
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        prefs.setString('taskTitle', value);
                        title = value;
                      },
                    ),
                  ),
                  Divider(),
                  FormWidget(
                    hintText: 'Description',
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
                                content: Text('Task added', style: kCinzel),
                              ),
                            );
                            taskTitle = prefs.getString('taskTitle');
                            Provider.of<TaskData>(context, listen: false).addTask(title, description);
                            Navigator.pushNamed(context, TaskScreen.ROUTE);
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
