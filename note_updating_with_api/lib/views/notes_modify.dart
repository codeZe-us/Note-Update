import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteID;
  bool get isEditing => noteID != null;
  const NoteModify({super.key, required this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing == null ? 'Create Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Note title'),
            ),
            Container(
              height: 8,
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            Container(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
