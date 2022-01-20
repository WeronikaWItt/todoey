import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/add_task.dart';
import 'package:to_do/widgets/info_dialog.dart';
import 'package:to_do/widgets/tasks_list.dart';

class TaskScreen extends StatelessWidget {
  static const ROUTE = '/task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kAccent,
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Add.ROUTE);
          }),
      body: Container(
        decoration: BoxDecoration(
          color: kAccent,
          image: DecorationImage(
            image: AssetImage("images/background_full.png"),
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70.0, right: 90.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoDialog(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('Today is ${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                        style: kPacifico),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text('${Provider.of<TaskData>(context).taskCount} Tasks', style: kCinzel),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
