import 'package:flutter/material.dart';
import  'package:flutter_slidable/flutter_slidable.dart';




// Custom task-tile
//

class TaskTile extends StatefulWidget {
  TaskTile({
    super.key,
    required this.taskDone,
    required this.text,
    required this.ontap,
    required this.slideAction,
  });

  bool taskDone;
  String text;
  VoidCallback ontap;
  void Function(BuildContext) slideAction;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Slidable(
        key: ValueKey(0),
        endActionPane: ActionPane(
          motion: BehindMotion(),
          children: [
            SlidableAction(
              onPressed: widget.slideAction,
              icon: Icons.delete,
              label: 'Delete',
            ),

          ],
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius:   BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Checkbox(value: widget.taskDone, onChanged: (value) => widget.ontap() ),
              Expanded(
                child: Text(widget.text,

                  style: TextStyle(
                      decoration: !widget.taskDone ?
                      TextDecoration.none :
                      TextDecoration.lineThrough ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


