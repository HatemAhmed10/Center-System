// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'constants.dart';

// class CustomTextField extends StatefulWidget {
//   CustomTextField(
//       {super.key,
//       this.maxLines = 1,
//       this.onSaved,
//       this.onChanged,
//       required this.TextControlle});

//   final int maxLines;
//   String TextControlle;

//   final void Function(String?)? onSaved;

//   final Function(String)? onChanged;

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       textAlign: TextAlign.right,
//       textDirection: TextDirection.rtl,
//       decoration: InputDecoration(
//         border: buildBorder(),
//         enabledBorder: buildBorder(),
//         focusedBorder: buildBorder(kPrimaryColor),
//       ),
//       onChanged: (value) {
//         TextControlle = value;
//       },
//     );
//   }

//   OutlineInputBorder buildBorder([color]) {
//     return OutlineInputBorder(
//         borderRadius: BorderRadius.circular(
//           8,
//         ),
//         borderSide: BorderSide(
//           color: color ?? const Color.fromRGBO(105, 36, 107, 1),
//         ));
//   }
// }
