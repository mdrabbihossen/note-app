import 'package:flutter/material.dart';

class NoteData {
  String text;
  String desc;
  Color color;

  NoteData({
    required this.text,
    required this.color,
    required this.desc,
  });
}

List<NoteData> notes = [
  NoteData(
    text: 'UI Concepts Worth Existing',
    color: Color(0xffFD99FF),
    desc: 'No Need to explain',
  ),
  NoteData(
    text: 'Book Review : The Design of Everyday',
    color: Color(0xffFF9E9E),
    desc: 'No Need to explain',
  ),
  NoteData(
    text: 'Anime\'s produced by Ufo-table',
    color: Color(0xff91F48F),
    desc: 'No Need to explain',
  ),
  NoteData(
    text: 'Mangas planned to read',
    color: Color(0xffFFF599),
    desc: 'No Need to explain',
  ),
  NoteData(
    text: 'Awesome tweets collection',
    color: Color(0xff9EFFFF),
    desc: 'No Need to explain',
  ),
  NoteData(
    text: 'List of free & open source apps',
    color: Color(0xffB69CFF),
    desc: 'No Need to explain',
  ),
];
