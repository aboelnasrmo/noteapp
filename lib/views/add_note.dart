import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

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
  String? time;
  XFile? image;

  getImage() async {
    final myImage =
        await ImagePicker.platform.getImage(source: ImageSource.camera);
    setState(() {
      image = myImage;
    });
  }

  submitData() async {
    final isValid = _formKey.currentState!.validate();
    time =
        "${DateFormat.yMMMEd().format(DateTime.now())} ${DateFormat.Hm().format(DateTime.now())}";

    if (isValid) {
      Hive.box<Note>('note').add(
        Note(title: title, decs: desc, time: time, image: image!.path),
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
              const SizedBox(
                height: 25,
              ),
              image == null ? Container() : Image.file(File(image!.path)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.camera),
      ),
    );
  }
}
