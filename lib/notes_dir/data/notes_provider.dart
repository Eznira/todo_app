import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'note_model.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> notes = [];

  //Reference local storage noteList
  // ie., create noteList db:
  final _noteBox = Hive.box("notes");

  // first time note
  void _initializeFirstNote() {
    final note = Note(
        title: 'Fermi Dirac',
        text: "Expected date of"
            "delivery is functional, don't try to understand this");
    notes.add(note);
  }

  Note newNote() {
    Note note = Note(title: "", text: "");
    return note;
  }

  //Read from noteListBox
  void getLocalStorage() {
    final storedNotes = _noteBox.get("notes");
    if (storedNotes == null) {
      _initializeFirstNote();
    } else {
      notes = List<Note>.from(storedNotes as List<dynamic>);
      print("Getting from local db!...");
    }
  }

  // Update noteListBox
  void _updateLocalStorage() {
    _noteBox.put("notes", notes);
    notifyListeners();
    print("Successfully updated db!...");
  }

  // addNewNote
  void addNewNote(Note note) {
    notes.add(note);
    _updateLocalStorage();
  }

  // delete note
  void deleteNote(Note note) {
    notes.remove(note);
    _updateLocalStorage();
  }

  // update existing note
  void updateExistingNote(Note note) {
    if (notes.contains(note)) {
      notes.remove(note);
      notes.add(note);
    }
    _updateLocalStorage();
  }
}
