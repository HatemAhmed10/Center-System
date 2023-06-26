import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CustomshowDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback? onPressedOK;
  final VoidCallback? onPressedOKCancel;

  CustomshowDialog(
      {required this.title,
      required this.message,
      required this.onPressedOK,
      required this.onPressedOKCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.white,
      title: Text(title.toString()),
      content: Container(child: Text(message.toString())),
      actions: [
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: kBackGrounBlackdAny),
          ),
          onPressed: () {
            onPressedOKCancel!();
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: kColorPrimrywite,
            border: Border.all(
              color: kBackGrounBlackdAny,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: MaterialButton(
            child: Text("OK"),
            onPressed: () {
              onPressedOK!();
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
