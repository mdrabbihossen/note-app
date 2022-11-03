import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:note_keeper_app/constants/constants.dart';

Widget noteList({
  required Color color,
  required String noteText,
  required String noteDesc,
  required VoidCallback onClick,
  required Function(BuildContext)? onDelete,
}) =>
    Column(
      children: [
        GestureDetector(
          onDoubleTap: onClick,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Slidable(
              endActionPane: ActionPane(
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: onDelete,
                    icon: Icons.delete,
                    label: 'Edit',
                    backgroundColor: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 45, top: 22, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noteText,
                          style: kTextStyle.copyWith(
                            fontSize: 20,
                            color: Color(0xff263238),
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          noteDesc,
                          style: kTextStyle.copyWith(
                            fontSize: 13,
                            color: Color(0xff263238).withOpacity(0.5),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
