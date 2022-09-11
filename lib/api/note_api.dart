import 'dart:convert';

import 'package:notes/models/note.dart';
import 'package:http/http.dart' as http;
import 'package:notes/provider/notes.dart';

class NoteApi {
  Future<List<Note>> getAllNote() async {
    final uri = Uri.parse(
        'https://notes-4f0cf-default-rtdb.asia-southeast1.firebasedatabase.app/notes.json');
    final respone = await http.get(uri);
    final results = json.decode(respone.body) as Map<String, dynamic>;
    List<Note> notes = [];
    results.forEach((key, value) {
      notes.add(Note(
        id: key,
        title: value['title'],
        note: value['note'],
        isPinned: value['isPinned'],
        updatedAt: DateTime.parse(value['updated_at']),
        createdAt: DateTime.parse(value['created_at']),
      ));
    });
    return notes;
  }

  Future<String> postNote(Note note) async {
    final uri = Uri.parse(
        'https://notes-4f0cf-default-rtdb.asia-southeast1.firebasedatabase.app/notes.json');

    Map<String, dynamic> map = {
      'title': note.title,
      'note': note.note,
      'isiPinned': note.isPinned,
      'updated_at': note.updatedAt.toIso8601String(),
      'created_at': note.createdAt.toIso8601String(),
    };

    final body = json.encode(map);
    final response = await http.post(uri, body: body);

    print(response.body);
  }
}
