import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/note.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? desc;

  submitData() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      Hive.box<Note>('note').add(
        Note(title: title, decs: desc),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: submitData, icon: const Icon(Icons.add)),
        ],
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                autocorrect: false,
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextFormField(
                minLines: 2,
                maxLines: 10,
                decoration: const InputDecoration(
                  label: Text('Desc'),
                ),
                autocorrect: false,
                onChanged: (value) {
                  setState(() {
                    desc = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
