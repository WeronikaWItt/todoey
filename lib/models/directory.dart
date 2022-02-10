// import 'dart:io';
//
// import 'package:path_provider/path_provider.dart';
// import 'package:to_do/models/task.dart';
//
// class Directory {
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//
//     return directory.path;
//   }
//
//   Future<File> get getFilePath async {
//     final path = await _localPath;
//     return File('$path/tasks.txt');
//   }
//
//   Future<File> writeTasks(Task task) async {
//     final file = await getFilePath;
//
//     return file.writeAsString('$task');
//   }
//
//   Future<String> readTasks() async {
//     try {
//       final file = await getFilePath;
//
//       final contents = await file.readAsString();
//
//       return contents;
//     } catch (e) {
//       return ' ';
//     }
//   }
// }
