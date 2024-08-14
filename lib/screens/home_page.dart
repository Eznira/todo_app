import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/screens/add_task_dialog.dart';
import 'package:todo_app/util/task_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Object for accesing input data, it is passed as a parameter to the
  /// addTaskDialog to get the users input(todo task).
  final _controller = TextEditingController();

  /// Called when the FAB is tapped
  void _addTaskPopUp() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTaskDialog(
            controller: _controller,
            saveAction: _saveTask,
          );
        });
  }

  /// Called when the save button on the addTaskDialog is pressed
  /// Saves task by appending to taskList and then updating the local db.
  void _saveTask() {
    // setState(() {
    //   db.taskList.add([false, _controller.text]);
    //   db.updateLocalStorage();
    // });
    final db = context.read<DataBase>();
    db.addTask([false, _controller.text]);
    Navigator.of(context).pop();
    _controller.clear();
  }

  /// Toogles task from done to undone or vice-versa and saves to the local
  /// db.
  void _toggleTaskState(int index) {
    // setState(() {
    //   db.taskList[index][0] = !db.taskList[index][0];
    //   db.updateLocalStorage();
    // });
    final db = context.read<DataBase>();
    db.toggleTaskState(index);
  }

  /// Deletes tasks from taskList and save changes in the local db.
  void _deleteTask(int index) {
    // setState(() {
    //   db.taskList.removeAt(index);
    //   db.updateLocalStorage();
    // });
    final db = context.read<DataBase>();
    db.removeTask(index);
  }

  @override
  void initState() {
    // Load first task for the first use of the app, else load from
    // local storage.

    /// Database instance containing the list of task data and other functions
    /// for dabaase operaions.
    /// Uses hive for local storage.
    final db = context.read<DataBase>();

    if (db.taskListBox.get('taskList') == null) {
      db.loadFirstTask();
    } else {
      db.getLocalStorage();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBase>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
          backgroundColor: Colors.purple,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: _addTaskPopUp, child: const Icon(Icons.add)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            if (value.taskList.isEmpty) {
              Container();
            } else {
              return TaskTile(
                taskDone: value.taskList[index][0],
                text: value.taskList[index][1],
                ontap: () => _toggleTaskState(index),
                slideAction: (context) => _deleteTask(index),
              );
            }
          },
          itemCount: value.taskList.length,
        ),
      ),
    );
  }
}
