import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/theme_provider.dart';
import 'package:todo_app/notes_dir/data/notes_provider.dart';
import 'package:todo_app/notes_dir/screens/new_note.dart';
import 'package:todo_app/notes_dir/utils/note_tile.dart';

import '../../database/themes.dart';
import '../data/note_model.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late final noteProvider = context.read<NotesProvider>();

  void _newNote() {
    Note note = noteProvider.newNote();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewNote(note: note, isNewNote: true)),
    );
  }

  void _deleteNote(Note note) {
    noteProvider.deleteNote(note);
  }

  @override
  void initState() {
    noteProvider.getLocalStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, NotesProvider>(
      builder: (context, themeProvider, noteProvider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: _newNote,
          child: const Icon(Icons.edit),
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
                      const Padding(
                        padding: EdgeInsets.all(16.0),
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
                            value: themeProvider.currentTheme == lightMode
                                ? false
                                : true,
                            onChanged: (value) => themeProvider.toggleTheme(),
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
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    if (noteProvider.notes.isEmpty) {
                      return Container();
                    } else {
                      final currentNote = noteProvider.notes[index];

                      return NoteTile(
                        note: currentNote,
                        onDelete: () => _deleteNote(currentNote),
                      );
                    }
                  },
                  itemCount: noteProvider.notes.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
