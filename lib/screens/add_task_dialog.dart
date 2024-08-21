import 'package:flutter/material.dart';
import 'package:todo_app/util/button.dart';

// Add task widget

class AddTaskDialog extends StatefulWidget {
  AddTaskDialog(
      {super.key,
      required TextEditingController this.controller,
      required this.saveAction});

  TextEditingController controller;
  void Function() saveAction;

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary), // Blue border on focus
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', ontap: widget.saveAction),
                SizedBox(
                  width: 12,
                ),
                MyButton(text: 'Cancel', ontap: Navigator.of(context).pop),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
