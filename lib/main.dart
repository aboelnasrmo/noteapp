import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/views/note_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

import 'models/note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<Note>(NoteAdapter());
  await Hive.openBox<Note>('note');

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
