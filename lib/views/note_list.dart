import 'package:flutter/material.dart';
import 'package:rest_api/models/note_for_listing.dart';
import 'package:rest_api/views/note_delete.dart';
import 'package:rest_api/views/note_modify.dart';

class NoteList extends StatelessWidget {
  // variables et data de pour la liste
  final notes = [
    NoteForListing(
      noteID: "1",
      noteTitle: "Note 1",
      createDataTime: "12/02/2021",
      lastesEditDataTime: "25/03/2021",
    ),
    NoteForListing(
      noteID: "1",
      noteTitle: "Note 2",
      createDataTime: "12/02/2021",
      lastesEditDataTime: "25/03/2021",
    ),
    NoteForListing(
      noteID: "1",
      noteTitle: "Note 2",
      createDataTime: "12/02/2021",
      lastesEditDataTime: "25/03/2021",
    ),
  ];
  // format de date time JOUR/MOIS/ANNNEE
  formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => NoteModify(
                    noteID: '',
                  )));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction) async {
              final result = await showDialog(
                  context: context, builder: (_) => NoteDelete());
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(Icons.delete, color: Colors.white),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              //${formatDateTime(notes[index].lastesEditDataTime as DateTime)}
              subtitle: Text('Last edited on 12/12/1212'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteModify(noteID: notes[index].noteID)));
              },
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
