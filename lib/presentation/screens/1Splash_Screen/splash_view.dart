import 'dart:async';
import 'package:bookstore/business_logic/test/searche_cubt.dart';
import 'package:flutter/material.dart';

import '../../../business_logic/test/searche_state.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/assets_manager.dart';
import '../2Teacher_Screen/Teacher_Screen.dart';
import '../test/1searche.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> imagePaths = [
    ImageAssets.logo,
    ImageAssets.teacher1,
    ImageAssets.teacher2,
    ImageAssets.teacher3,
    ImageAssets.teacher4,
    ImageAssets.teacher5,
    ImageAssets.teacher6,
    ImageAssets.teacher7,
    ImageAssets.teacher8,
    ImageAssets.teacher9,
  ];
  int currentIndex = 0;

  void changeImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imagePaths.length;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      // backgroundColor: Color(0x1F1F1F),
      body: Center(
        child: Column(
          children: [
            Expanded(flex: 5, child: Image.asset(imagePaths[currentIndex])),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Teacher_Screen');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: kBackGroundAny,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                          ),
                          child: Icon(
                            Icons.navigate_next,
                            size: 30,
                            color: kColorPrimrywite,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
