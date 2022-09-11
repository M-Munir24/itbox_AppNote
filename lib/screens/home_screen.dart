import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/provider/notes.dart';
import 'package:notes/screens/add_or_detail_note_screen.dart';
import 'package:notes/widgets/notes_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      body: FutureBuilder(
          future: Provider.of<Notes>(context, listen: false).getAndSetNotes(),
          builder: (ctx, noteSnapshot) {
            if (noteSnapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );

            return NotesGrid();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddOrDetailScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
