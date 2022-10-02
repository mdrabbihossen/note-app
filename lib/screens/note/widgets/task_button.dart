import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget taskButton(
        {required Color color,
        required String buttonText,
        required VoidCallback onClick}) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            ),
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
          ),
          onPressed: onClick,
          child: Text(
            buttonText,
            style: GoogleFonts.nunito(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
