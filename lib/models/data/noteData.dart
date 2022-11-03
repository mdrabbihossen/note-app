import 'package:flutter/material.dart';

class NoteData {
  String text;
  Color color;

  NoteData({
    required this.text,
    required this.color,
  });
}

List<NoteData> notes = [
  NoteData(
    text: 'UI Concepts Worth Existing',
    color: Color(0xffFD99FF),
  ),
  NoteData(
    text: 'Book Review : The Design of Everyday',
    color: Color(0xffFF9E9E),
  ),
  NoteData(
    text: 'Anime\'s produced by Ufo-table',
    color: Color(0xff91F48F),
  ),
  NoteData(
    text: 'Mangas planned to read',
    color: Color(0xffFFF599),
  ),
  NoteData(
    text: 'Awesome tweets collection',
    color: Color(0xff9EFFFF),
  ),
  NoteData(
    text: 'List of free & open source apps',
    color: Color(0xffB69CFF),
  ),
];
