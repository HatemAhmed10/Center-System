import 'package:flutter/material.dart';
import '../styles/assets_manager.dart';

// const kPrimaryColor = Color.fromRGBO(105, 36, 107, 1);
const kBlackColor = Colors.black;
const kWhiteColor = Colors.white;

const kTeacherBox = 'Teacher_box4';
const kCourseBox = 'Course_box4';

List<Color> kColors = const [
  Color(0xffAC3931),
  Color(0xffE5D352),
  Color(0xffD9E76C),
  Color(0xff537D8D),
  Color(0xff482C3D),
];

final List<String> imagePaths = [
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

// list of colors that we use in our app
const kBackgroundColor = Color(0xFFF1EFF1);
const kPrimaryColor = Color(0xFF035AA6);
const kSecondaryColor = Color(0xFFFFA41B);
const kTextColor = Color(0xFF000839);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF40BAD5);

const kDefaultPadding = 12.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

// My Text Styles
const kHeadingextStyle = TextStyle(
  fontSize: 28,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);
const kSubheadingextStyle = TextStyle(
  fontSize: 24,
  color: Color(0xFF61688B),
  height: 2,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

const kSubtitleTextSyule = TextStyle(
  fontSize: 18,
  color: kTextColor,
  // fontWeight: FontWeight.bold,
);

const kBackGroundAny = Colors.white60;
const kColorPrimrywite = Color(0xFF6E2470);
const kColorPrimryBold = Color(0xFF3F0A3F);
const kBackGrounBlackdAny = Color(0xFF1F1F1F);

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.black,
      ),
    );
