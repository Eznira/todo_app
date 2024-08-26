import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

///
/// Database Class
///

class TaskProvider extends ChangeNotifier {
  late List taskList = taskBox.get("taskList");

  // Reference localStorage box: "taskListBox"
  final taskBox = Hive.box("taskList");

  // save to local storage
  void _updateLocalStorage() {
    taskBox.put("taskList", taskList);
    notifyListeners();
  }

  // loads first task
  void loadFirstTask() {
    taskList.add([false, "Write your first todo task!"]);
  }

  void addTask(List task) {
    taskList.add(task);
    _updateLocalStorage();
  }

  void removeTask(int index) {
    taskList.removeAt(index);
    _updateLocalStorage();
  }

  void toggleTaskState(int index) {
    taskList[index][0] = !taskList[index][0];
    _updateLocalStorage();
  }
}
