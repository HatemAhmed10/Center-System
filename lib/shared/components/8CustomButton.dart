import 'package:flutter/material.dart';

import 'constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.isLoading = false,
      required this.ButtonName});

  final void Function()? onTap;

  final bool isLoading;
  final String ButtonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
            color: kColorPrimrywite.withOpacity(0.4),
            borderRadius: BorderRadius.circular(
              18,
            )),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Text(
                  ButtonName.toString(),
                  style: TextStyle(
                    color: kBackGrounBlackdAny,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
