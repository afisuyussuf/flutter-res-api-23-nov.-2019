import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  // variables note ID
  final String noteID;
  // ignore: unnecessary_null_comparison
  bool get isEditing => noteID != null;
  NoteModify({required this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit note' : 'Create note')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Note title',
              ),
            ),
            Container(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Note content',
              ),
            ),
            Container(height: 16),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                child: Text('Submit', style: TextStyle(color: Colors.amber)),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
