import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget addTaskField(
        {required String hintText,
        required int fontSize,
        int? cursorHeight,
        required int maxLength,
        required TextEditingController controller}) =>
    Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Container(
        child: TextFormField(
          maxLength: maxLength,
          controller: controller,
          style: GoogleFonts.raleway(
            color: Colors.white.withOpacity(0.6),
            letterSpacing: 1.6,
            fontSize: 20,
            height: 1.5,
          ),
          cursorHeight: cursorHeight?.toDouble(),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.nunito(
              fontSize: fontSize.toDouble(),
              color: Colors.white.withOpacity(0.5),
              letterSpacing: 1.5,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
