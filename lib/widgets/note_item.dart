import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/presentation/custom_icon_icons.dart';
import 'package:notes/provider/notes.dart';
import 'package:notes/screens/add_or_detail_note_screen.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatefulWidget {
  //const NoteItem({Key key}) : super(key: key);
  final String id;

  NoteItem({
    @required this.id,
  });

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  //bool _isPinned;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   _isPinned = widget.isPinned;

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<Notes>(context, listen: false);
    Note note = noteProvider.getNote(widget.id);
    print(note.updatedAt);
    return Dismissible(
      key: Key(note.id),
      onDismissed: ((direction) {
        noteProvider.deleteNote(note.id);
      }),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(AddOrDetailScreen.routeName, arguments: note.id),
        child: GridTile(
          header: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                noteProvider.toggleIsPinned(note.id);
              },
              icon: Icon(
                note.isPinned ? CustomIcon.pin : CustomIcon.pin_outline,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[800]),
            child: Text(note.note),
            padding: EdgeInsets.all(12),
          ),
          footer: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            child: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(note.title),
            ),
          ),
        ),
      ),
    );
  }
}
