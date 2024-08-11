import 'package:flutter/material.dart';
import 'package:todo_app/add_task_dialog.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/util/task_tile.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /// Database instance containing the list of task data and other functions
  /// for dabaase operaions.
  /// Uses hive for local storage.
  final db = DataBase();

  /// Object for accesing input data, it is passed as a parameter to the
  /// addTaskDialog to get the users input(todo task).
  final _controller = TextEditingController();

  /// Called when the FAB is tapped
  void _addTaskPopUp() {
    showDialog(context: context, builder: (context) {
      return AddTaskDialog(controller: _controller, saveAction: _saveTask,);
    });
  }

  /// Called when the save button on the addTaskDialog is pressed
  /// Saves task by appending to taskList and then updating the local db.
  void _saveTask() {
    setState(() {
      db.taskList.add([false, _controller.text]);
      db.updateLocalStorage();
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  /// Toogles task from done to undone or vice-versa and saves to the local
  /// db.
  void _toggleTaskState(int index) {
    setState(() {
      db.taskList[index][0] = !db.taskList[index][0];
      db.updateLocalStorage();
    });
  }

  /// Deletes tasks from taskList and save changes in the local db.
  void _deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
      db.updateLocalStorage();
    });
  }

  @override
  void initState() {

    // Load first task for the first use of the app, else load from
    // local storage.

    if(db.taskListBox.get('taskList') == null) {
      db.firstTask();

    } else {
      db.getLocalStorage();
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    print("Building homepage!");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _addTaskPopUp,
          child: const Icon(Icons.add)),

      body: ListView.builder(
        itemBuilder: (context, index) {

          if (db.taskList.isEmpty) {
            Container();
          } else {
            return TaskTile(
              taskDone: db.taskList[index][0],
              text: db.taskList[index][1],
              ontap: () => _toggleTaskState(index),
              slideAction: (context) => _deleteTask(index),
            );
          }

        },
        itemCount: db.taskList.length,
      ) ,
    );
  }
}


