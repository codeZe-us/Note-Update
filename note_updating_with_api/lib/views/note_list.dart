import 'package:flutter/material.dart';
import 'package:note_updating_with_api/models/note_models.dart';
import 'package:note_updating_with_api/views/note_delete.dart';
import 'package:note_updating_with_api/views/notes_modify.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final notes = [
    NoteForListing(
        noteId: "1",
        createDateTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
        noteTitle: 'Note 1'),
    NoteForListing(
        noteId: "2",
        createDateTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
        noteTitle: 'Note 2'),
    NoteForListing(
        noteId: "3",
        createDateTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
        noteTitle: 'Note 3'),
    NoteForListing(
        noteId: "4",
        createDateTime: DateTime.now(),
        lastEditDateTime: DateTime.now(),
        noteTitle: 'Note 4'),
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List of notes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_,) => NoteModify(noteID: notes[index].noteId,)));
        },
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteId),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => const NoteDelete());
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.only(left: 16),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteModify(noteID: notes[index].noteId)));
              },
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                  'Last edited on ${formatDateTime(notes[index].lastEditDateTime)}'),
            ),
          );
        },
        separatorBuilder: (_, __) => const Divider(
          height: 1,
          color: Colors.black,
        ),
        itemCount: notes.length,
      ),
    );
  }
}
