import 'package:flutter/material.dart';

Widget titleBarIcons({required IconData icon}) => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff3B3B3B).withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3, left: 3),
        child: IconButton(
          icon: Icon(
            icon,
            size: 22,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
