import 'package:flutter/material.dart';

import '../data/note_model.dart';

class NewNote extends StatefulWidget {
  NewNote({required this.note, required this.isNewNote});

  Note note;
  bool isNewNote;

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  bool isEditingTitle = false;
  bool isEditingMainText = false;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isNewNote) {
      _titleController.text = widget.note.title;
      _mainTextController.text = widget.note.text;

      //isEditingTitle = true;
      isEditingMainText = true;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _mainTextController.dispose();
    super.dispose();
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  void _save() {
    widget.note.title = _titleController.text;
    widget.note.text = _mainTextController.text;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _navigateBack,
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: _save,
                    icon: const Icon(
                      Icons.check,
                      size: 28,
                    ),
                  ),
                ],
              ),
              Container(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isEditingTitle = true;
                          });
                        },
                        child: isEditingTitle
                            ? TextField(
                                controller: _titleController,
                                autofocus: true,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Untitled",
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  widget.isNewNote
                                      ? widget.note.title
                                      : "Untitled",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isEditingMainText = true;
                          });
                        },
                        child: isEditingMainText
                            ? TextField(
                                controller: _mainTextController,
                                maxLines: null,
                                autofocus: true,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.newline,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )
                            : const Text(
                                "Start typing here!",
                                style: const TextStyle(fontSize: 16),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
