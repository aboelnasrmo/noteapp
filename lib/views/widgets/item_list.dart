import 'package:flutter/material.dart';

import '../../models/note.dart';
import 'custom_note_item.dart';

import 'package:hive_flutter/hive_flutter.dart';

class ItemList extends StatefulWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: Hive.box<Note>('note').listenable(),
            builder: (context, Box<Note> box, _) {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final note = box.getAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NoteItem(
                      title: note!.title.toString(),
                      desc: note.decs.toString(),
                      index: index,
                      // index: box.deleteAt(index),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
