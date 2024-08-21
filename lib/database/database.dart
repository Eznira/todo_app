import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

///
/// Database Class
///

class DataBase extends ChangeNotifier {
  List taskList = [];

  bool themeValue = false;

  void toggleThemeValue() {
    themeValue = !themeValue;
    notifyListeners();
  }

  // Reference localStorage box: "taskListBox"
  final taskListBox = Hive.box("taskList");

  // loads first task
  void loadFirstTask() {
    taskList.add([false, "Write your first todo task!"]);
  }

  // loads from local storage
  void getLocalStorage() {
    taskList = taskListBox.get("taskList");
  }

  // save to local storage
  void updateLocalStorage() {
    taskListBox.put("taskList", taskList);
    notifyListeners();
  }

  void addTask(List task) {
    taskList.add(task);
    updateLocalStorage();
  }

  void removeTask(int index) {
    taskList.removeAt(index);
    updateLocalStorage();
  }

  void toggleTaskState(int index) {
    taskList[index][0] = !taskList[index][0];
    updateLocalStorage();
  }
}
