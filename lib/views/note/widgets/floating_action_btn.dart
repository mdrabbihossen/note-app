import 'package:flutter/material.dart';

Widget addedTask({String? taskButtonToolTip, required VoidCallback onPressed}) => FloatingActionButton(
      tooltip: taskButtonToolTip,
      backgroundColor: Color(0xff252525),
      onPressed: onPressed,
      child: Icon(
        Icons.add,
        size: 28,
      ),
    );
