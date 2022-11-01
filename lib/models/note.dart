// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? decs;
  @HiveField(2)
  String? time;
  @HiveField(3)
  String? image;
  Note({
    @required this.title,
    @required this.decs,
    @required this.time,
    @required this.image,
  });
}
