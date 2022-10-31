import 'package:flutter/material.dart';
import 'package:noteapp/views/add_note.dart';
import 'package:noteapp/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(' + | add note'),
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const AddNote();
              },
            ),
          );
        },
      ),
      body: const NotesViewBody(),
    );
  }
}
