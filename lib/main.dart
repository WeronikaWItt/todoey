import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/add_screen.dart';
import 'package:to_do/screens/edit_task.dart';
import 'package:to_do/screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskData>(
            create: (_) => TaskData(),
            builder: (context, child) {
              return MaterialApp(
                title: 'Todoey',
                initialRoute: TaskScreen.ROUTE,
                routes: {
                  TaskScreen.ROUTE: (context) => TaskScreen(),
                  EditTask.ROUTE: (context) => EditTask(),
                  Add.ROUTE: (context) => Add(),
                },
              );
            })
      ],
    );
  }
}
