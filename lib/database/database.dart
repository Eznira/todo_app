import 'package:hive/hive.dart';

///
/// Database Class
///

class DataBase{
  List taskList = [];

  // Reference localStorage box: "taskListBox"
  final taskListBox = Hive.box("taskList");

  // loads first task
  void firstTask(){
    taskList.add([false, "Write your first todo task!"]);
  }

  // loads from local storage
  void getLocalStorage(){
    taskList = taskListBox.get("taskList");
  }

  // save to local storage
  void updateLocalStorage(){
    taskListBox.put("taskList", taskList);
  }

}