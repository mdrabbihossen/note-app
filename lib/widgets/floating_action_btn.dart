import 'package:flutter/material.dart';

Widget addedTask({String? taskButtonToolTip, required VoidCallback onpressed}) => FloatingActionButton(
      tooltip: taskButtonToolTip,
      backgroundColor: Color(0xff252525),
      onPressed: onpressed,
      child: Icon(
        Icons.add,
        size: 28,
      ),
    );
