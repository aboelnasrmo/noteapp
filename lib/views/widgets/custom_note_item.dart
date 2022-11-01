// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/note.dart';
import 'dart:math' as math;

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    this.color,
    this.time,
    this.title,
    this.desc,
    this.index,
  }) : super(key: key);
  final String? title;
  final String? desc;
  final int? index;
  final String? time;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24, left: 16, top: 24),
      decoration: BoxDecoration(
        color: Color((math.Random().nextDouble() * 0xFF1111).toInt())
            .withOpacity(1.0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              title.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16),
              child: Text(
                desc.toString(),
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                Hive.box<Note>('note').deleteAt(index!);
              },
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              time.toString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
