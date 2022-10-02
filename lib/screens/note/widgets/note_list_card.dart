import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget noteList(
        {required Color color,
        required String noteText,
        required VoidCallback onClick}) =>
    Column(
      children: [
        GestureDetector(
          onDoubleTap: onClick,
          
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              width: 365,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 46, top: 22, right: 15),
                child: Text(
                  noteText,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    letterSpacing: 1,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
