import 'package:flutter/material.dart';
import 'package:todo_app/add_task_dialog.dart';
import 'package:todo_app/util/task_tile.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // T
  List<TaskTile> taskTiles = [
    TaskTile(taskDone: false, text: "This is so owesome ed",),
  ];

  final _controller = TextEditingController();


  void _addTaskRequest() {

    showDialog(context: context, builder: (context) {
      return AddTaskDialog(controller: _controller, saveAction: saveTask,);
    });
  }

  void saveTask() {
    // create tasktile, append to task list
    setState(() {
      taskTiles.add(TaskTile(taskDone: false, text: _controller.text));
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

      body: SingleChildScrollView(
        child: Column(
          children: taskTiles,
        ),
      ),
    );
  }
}


