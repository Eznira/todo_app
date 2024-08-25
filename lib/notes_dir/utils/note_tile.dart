import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popover/popover.dart';
import 'package:todo_app/notes_dir/screens/new_note.dart';

import '../data/note_model.dart';
import 'note_menu.dart';

class NoteTile extends StatelessWidget {
  NoteTile({
    super.key,
    required this.note,
    required this.onDelete,
  });

  Note note;
  void Function() onDelete;

  void _onEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewNote(
                note: note,
                isNewNote: true,
              )),
    );
  }

  void _onCopy(BuildContext context) {
    Clipboard.setData(
      ClipboardData(text: note.text + '\n' + note.title),
    );

    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text('Copied to Clipboard!'),
    //     behavior: SnackBarBehavior.floating,
    //   ),
    // );

    showCustomSnackbar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    note.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Builder(builder: (context) {
                  return IconButton(
                      onPressed: () => showPopover(
                            context: context,
                            bodyBuilder: (context) => NoteMenu(
                              onCopy: () => _onCopy(context),
                              onDelete: () {},
                              onEdit: () => _onEdit(context),
                            ),
                          ),
                      icon: Icon(Icons.more_vert));
                }),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(note.text),
            ),
          ),
        ],
      ),
    );
  }
}

// todo: implement delete function

void showCustomSnackbar(BuildContext context) {
  final overlayState = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 20.0, // Example position
      left: 10.0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Copied to Clipboard!"),
          ),
        ),
      ),
    ),
  );

  overlayState.insert(overlayEntry);

  // Dismiss the snackbar after a certain duration
  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
