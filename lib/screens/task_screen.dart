import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/constants.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/add_task.dart';
import 'package:to_do/widgets/info_dialog.dart';
import 'package:to_do/widgets/tasks_list.dart';

class TaskScreen extends StatefulWidget {
  static const ROUTE = '/task';

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    TasksList(),
    InfoDialog(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kAccent,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              label: 'Todos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
              label: 'Info'),
        ],
      ),
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
                children: [
                  SizedBox(height: 10),
                  Text('${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}', style: kPacifico),
                  SizedBox(height: 10),
                  Text('${Provider.of<TaskData>(context).taskCount} Tasks', style: kCinzel),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: _widgetOptions.elementAt(_selectedIndex),
                // /child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
