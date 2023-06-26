import 'package:bookstore/presentation/screens/1Splash_Screen/splash_view.dart';
import 'package:bookstore/presentation/screens/2Teacher_Screen/Add_Teacher_Screen.dart';
import 'package:bookstore/presentation/screens/2Teacher_Screen/Teacher_Screen.dart';
import 'package:bookstore/presentation/screens/3CoursesScreen/CoursesView.dart';
import 'package:bookstore/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'models/1Teacher_Model/TeacherModel.dart';
import 'models/2Course_Model/CourseModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TeacherModelAdapter());
  await Hive.openBox<TeacherModel>(kTeacherBox);

  Hive.registerAdapter(CourseModelAdapter());
  await Hive.openBox<CourseModel>(kCourseBox);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/Teacher_Screen': (context) => Teacher_Screen(),
        '/Add_Teacher': (context) => Add_Teacher_Screen(),
      },
    );
  }
}
