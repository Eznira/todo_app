import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

///
/// Database Class
///

class DataBase extends ChangeNotifier {
  List taskList = [];

  // Reference localStorage box: "taskListBox"
  final taskListBox = Hive.box("taskList");

  // loads first task
  void loadFirstTask() {
    taskList.add([false, "Write your first todo task!"]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  // loads from local storage
  void getLocalStorage() {
    taskList = taskListBox.get("taskList");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  // save to local storage
  void updateLocalStorage() {
    taskListBox.put("taskList", taskList);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
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
