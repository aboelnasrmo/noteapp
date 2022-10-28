import 'package:flutter/material.dart';

import 'custom_note_item.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) => const NoteItem(),
          separatorBuilder: (context, index) => const Divider(thickness: 0),
          itemCount: 10),
    );
  }
}
