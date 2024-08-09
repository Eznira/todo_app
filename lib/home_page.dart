import 'package:flutter/material.dart';
import 'package:todo_app/add_task_dialog.dart';
import 'package:todo_app/util/task_tile.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List taskList = [[false, "Get to work!"]];
  final _controller = TextEditingController();


  void _addTaskRequest() {

    showDialog(context: context, builder: (context) {
      return AddTaskDialog(controller: _controller, saveAction: _saveTask,);
    });
  }

  void _saveTask() {
    // create tasktile, append to task list
    setState(() {
      taskList.add([false, _controller.text]);
    });
    Navigator.of(context).pop();
    _controller.text = '';
  }

  void _toggleTask(int index) {
    setState(() {
      taskList[index][0] = !taskList[index][0];
    });
  }
  void _deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _addTaskRequest,
          child: const Icon(Icons.add)),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
            taskDone: taskList[index][0],
            text: taskList[index][1],
            ontap: () => _toggleTask(index),
            slideAction: (context) => _deleteTask(index),
          );
        },
        itemCount: taskList.length,
      ),
    );
  }
}


