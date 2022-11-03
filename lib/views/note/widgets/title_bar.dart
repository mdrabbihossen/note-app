import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper_app/constants/constants.dart';
import 'package:note_keeper_app/widgets/title_bar_icons.dart';

Widget titleBar() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Text(
            'Notes',
            style: kTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, right: 20),
          child: Row(
            children: [
              titleBarIcons(icon: Icons.search),
              SizedBox(width: 15),
              titleBarIcons(icon: Icons.info_outline),
            ],
          ),
        )
      ],
    );
