import 'dart:ui';
import 'dart:math';

import 'package:your_note/utils.dart';

class Note {
  int id;
  String title;
  String content;
  bool isFavorite;
  bool isLocked;
  Color color;
  DateTime createdAt;
  DateTime updatedAt;

  Note.initialState()
      : id = 0,
        title = "title",
        content = "content",
        isFavorite = false,
        isLocked = false,
        color = Utils().noteRandomColor(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Note(this.id, this.title, this.content, this.color, this.isFavorite,
      this.isLocked, this.createdAt, this.updatedAt);
}
