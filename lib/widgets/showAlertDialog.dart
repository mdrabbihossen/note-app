import 'package:flutter/material.dart';

void showAlertDialog({required String title,required String message,required BuildContext context}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(message),
  );
  showDialog(context: context, builder: (_)=>alertDialog);
}