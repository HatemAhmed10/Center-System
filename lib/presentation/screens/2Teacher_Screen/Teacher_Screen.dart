import 'dart:math';
import 'package:uuid/uuid.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/Teacher_Cubit/Teacher_Cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/1cutomshowDialog.dart';
import '../../../shared/components/8CustomButton.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/assets_manager.dart';
import '../../widgets/2Teacher/1SearchBox.dart';
import '../../widgets/2Teacher/2ProductCard.dart';
import '../3CoursesScreen/CoursesView.dart';

class Teacher_Screen extends StatefulWidget {
  const Teacher_Screen({Key? key}) : super(key: key);

  @override
  State<Teacher_Screen> createState() => _Teacher_ScreenState();
}

class _Teacher_ScreenState extends State<Teacher_Screen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? teacherName, courseName;
  final double containerHeight = 200;
  final double profileHeight = 50;

  @override
  Widget build(BuildContext context) {
    final bottom = containerHeight - profileHeight;

    final random = Random();
    final randomNumber = random.nextInt(imagePaths.length);
    final randomImage = AssetImage(imagePaths[randomNumber]);

    return BlocProvider(
      create: (context) => TeachersCubit()..fetchAllTeachers(),
      child: Scaffold(
        backgroundColor: kBackGroundAny.withOpacity(0.9),
        appBar: AppBar(
          automaticallyImplyLeading: false, // Add this line
          backgroundColor: kBackGroundAny,
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Teacher',
            style: TextStyle(
              fontSize: 25,
              color: kColorPrimrywite,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Icon(
                Icons.home,
                size: 28,
                color: kBackGrounBlackdAny,
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: BlocBuilder<TeachersCubit, TeachersState>(
          builder: (context, state) {
            List<TeacherModel> Items =
                BlocProvider.of<TeachersCubit>(context).FTeachers!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SearchBox(),
                  myDivider(),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        // Our background
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          decoration: BoxDecoration(
                            color: kBackGrounBlackdAny.withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        Container(
                          height: 480,
                          child: ListView.builder(
                            // here we use our demo procuts list
                            itemCount: Items.length,
                            itemBuilder: (context, index) => ProductCard(
                              itemIndex: index,
                              product: Items[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoursesView(
                                      teacher: Items[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kColorPrimrywite.withOpacity(0.9),
          onPressed: () {
            Navigator.pushNamed(context, '/Add_Teacher');
          },
          child: Icon(
            size: 30,
            Icons.add,
            color: kBackGrounBlackdAny,
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        8,
      ),
      borderSide: BorderSide(
        color: color ?? const Color.fromRGBO(105, 36, 107, 1),
      ));
}

String generateRandomId() {
  var uuid = const Uuid();
  return uuid.v4();
}
