import 'package:flutter/material.dart';



// Custom task-tile

class TaskTile extends StatefulWidget {
  TaskTile({super.key, required this.taskDone, required this.text});

  bool taskDone;
  String text;

  void _toogleTaskState() => taskDone = !taskDone;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {

  void _completeTask() => setState((){
    widget._toogleTaskState();
  });
  void _onchanged(bool? value) => _completeTask();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _completeTask,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius:   BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Checkbox(value: widget.taskDone, onChanged: _onchanged),
            Text(widget.text,

              style: TextStyle(
                  decoration: !widget.taskDone ?
                  TextDecoration.none :
                  TextDecoration.lineThrough ),
            ),
            //todo: fix overflowing text issue
          ],
        ),
      ),
    );
  }
}


