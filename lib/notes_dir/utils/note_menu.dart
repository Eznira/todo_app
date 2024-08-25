import 'package:flutter/material.dart';

//Menu Widget
class NoteMenu extends StatelessWidget {
  NoteMenu({
    super.key,
    required this.onCopy,
    required this.onEdit,
    required this.onDelete,
  });

  void Function() onCopy;
  void Function() onEdit;
  void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onCopy();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Copy",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                )),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                onEdit();
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Edit",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                )),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onDelete,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Delete",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// todo: remove duplicate code
