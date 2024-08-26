import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'note_model.dart';

class NotesProvider extends ChangeNotifier {
  late List notes = [];

  //Reference local storage noteList
  // ie., create noteList db:
  final _noteBox = Hive.box("noteList");

  // first time note
  final note = Note(
      title: 'Fermi Dirac',
      text: "Expected date of"
          "delivery is functional, don't try to understand this");

  Note newNote() {
    Note note = Note(title: "", text: "");
    return note;
  }

  //Read from noteListBox
  void getLocalStorage() {
    if (_noteBox.get("noteList") == null) {
      notes.add(note);
    } else {
      notes = _noteBox.get("noteList");
    }
    notifyListeners();
  }

  // Update noteListBox
  void _updateLocalStorage() {
    _noteBox.put("noteList", notes);
    notifyListeners();
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
