import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: const NotesViewBody(),
    );
  }
}
