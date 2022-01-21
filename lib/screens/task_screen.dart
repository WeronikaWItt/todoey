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
              padding: EdgeInsets.only(top: 60.0, right: 50.0, bottom: 10.0, left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text('${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}', style: kPacifico),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${Provider.of<TaskData>(context).taskCount} Tasks', style: kCinzel),
                      InfoDialog(),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
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
