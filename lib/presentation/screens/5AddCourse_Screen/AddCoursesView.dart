import 'package:bookstore/models/2Course_Model/CourseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../business_logic/Course_Cubit/Course_cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/4CustomshowToast.dart';
import '../../../shared/components/8CustomButton.dart';
import '../../../shared/components/constants.dart';
import '../2Teacher_Screen/Teacher_Screen.dart';

class AddCoursesView extends StatelessWidget {
  AddCoursesView({Key? key, required this.teacher}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? CoursesName, CoursesPrice, TeacherRate, officeRate;
  final TeacherModel teacher;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesCubit(),
      child: Scaffold(
        backgroundColor: kBackGroundAny.withOpacity(0.9),
        appBar: AppBar(
          foregroundColor: kColorPrimrywite,
          backgroundColor: kBackGroundAny,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Add Course",
            style: TextStyle(
              fontSize: 25,
              color: kColorPrimrywite,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(kDefaultPadding),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 4, // 5 top and bottom
                    ),
                    decoration: BoxDecoration(
                      color: kBackGrounBlackdAny.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      cursorColor: kColorPrimrywite,
                      style: TextStyle(color: kColorPrimrywite),
                      validator: (value) {
                        int? shceck = int.tryParse(value!);
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        } else if (shceck != null) {
                          return 'Please enter  text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        CoursesName = value;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter Course Name',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      // validator: _emailValidator,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kDefaultPadding),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 4, // 5 top and bottom
                    ),
                    decoration: BoxDecoration(
                      color: kBackGrounBlackdAny.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      cursorColor: kColorPrimrywite,
                      style: TextStyle(color: kColorPrimrywite),
                      validator: (value) {
                        int? shceck = int.tryParse(value!);
                        if (value!.isEmpty) {
                          return 'Please enter Price';
                        } else if (shceck == null) {
                          return 'Please enter Number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        CoursesPrice = value;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter Courses Price ',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      // validator: _emailValidator,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kDefaultPadding),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 4, // 5 top and bottom
                    ),
                    decoration: BoxDecoration(
                      color: kBackGrounBlackdAny.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      cursorColor: kColorPrimrywite,
                      style: TextStyle(color: kColorPrimrywite),
                      validator: (value) {
                        int? shceck = int.tryParse(value!);
                        if (value!.isEmpty) {
                          return 'Please enter office Rate';
                        } else if (shceck == null) {
                          return 'Please enter Number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        officeRate = value;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter office Rate ',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      // validator: _emailValidator,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kDefaultPadding),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 4, // 5 top and bottom
                    ),
                    decoration: BoxDecoration(
                      color: kBackGrounBlackdAny.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      cursorColor: kColorPrimrywite,
                      style: TextStyle(color: kColorPrimrywite),
                      validator: (value) {
                        int? shceck = int.tryParse(value!);
                        if (value!.isEmpty) {
                          return 'Please enter Teacher Rate ';
                        } else if (shceck == null) {
                          return 'Please enter Number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        TeacherRate = value;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter Teacher Rate ',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      // validator: _emailValidator,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kDefaultPadding),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 4, // 5 top and bottom
                    ),
                    decoration: BoxDecoration(
                      color: kBackGrounBlackdAny.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: BlocBuilder<CoursesCubit, CoursesState>(
                      builder: (context, state) {
                        return MaterialButton(
                          minWidth: 150,
                          height: 70,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<CoursesCubit>(context).addCourse(
                                  TeacherID: teacher.teacherID,
                                  courseModel: CourseModel(
                                    CoursestudentList: [],
                                    CourseName: CoursesName.toString(),
                                    CourseID: generateRandomId(),
                                    CoursePrice: CoursesPrice.toString(),
                                    officeRate: officeRate.toString(),
                                    teacherRate: TeacherRate.toString(),
                                    TeacherId: teacher.teacherID,
                                    studentInfPay: {},
                                    studentPay: 0,
                                    studentAttend: {},
                                  ));

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Teacher_Screen();
                                }),
                              );
                            } else {
                              showToast(
                                  state: ToastStates.SUCCESS,
                                  text: "Please Add Data");
                            }
                          },
                          child: const Text(
                            'Add Course',
                            style: TextStyle(color: kColorPrimrywite),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String generateRandomId() {
  var uuid = const Uuid();
  return uuid.v4();
}
