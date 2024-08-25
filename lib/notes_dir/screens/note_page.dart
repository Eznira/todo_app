import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/task_provider.dart';
import 'package:todo_app/database/theme_provider.dart';
import 'package:todo_app/notes_dir/screens/new_note.dart';
import 'package:todo_app/notes_dir/utils/note_tile.dart';

import '../data/note_model.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

Note note = Note(title: "", text: "");

class _NotePageState extends State<NotePage> {
  void _newNote() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewNote(note: note, isNewNote: false)),
    );
  }

  void _toggleTheme(bool value) {
    context.read<TaskProvider>().toggleThemeValue();
    context.read<ThemeProvider>().toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _newNote,
          child: Icon(Icons.edit),
        ),
        appBar: AppBar(
          title: Text(
            "Notes",
            style: GoogleFonts.sofiaSans(
                fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Switch(
                            value: value.themeValue,
                            onChanged: _toggleTheme,
                          ),
                        ],
                      ),
                    ],
                  )),
              ListTile(
                leading: const Icon(Icons.note),
                title: const Text('Notes'),
                onTap: () {
                  // Navigate to notes route
                  Navigator.pushNamed(context, '/note_page');
                },
              ),
              ListTile(
                leading: const Icon(Icons.check_box),
                title: const Text('To-Do'),
                onTap: () {
                  // Navigate to to-do route
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    NoteTile(
                      note: note1,
                      onDelete: () {},
                    ),
                    NoteTile(
                      note: note1,
                      onDelete: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
