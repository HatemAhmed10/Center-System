import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';

import '../../../business_logic/Teacher_Cubit/Teacher_Cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/constants.dart';

class Add_Teacher_Screen extends StatelessWidget {
  const Add_Teacher_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? teacherName, courseName;

    bool _obscureText = true;
    String? _emailValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter Text';
      }

      return null;
    }

    return BlocProvider(
      create: (context) => TeachersCubit(),
      child: Scaffold(
        backgroundColor: kBackGroundAny.withOpacity(0.9),
        appBar: AppBar(
          foregroundColor: kColorPrimrywite,
          backgroundColor: kBackGroundAny,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Add Teacher",
            style: TextStyle(
              fontSize: 25,
              color: kColorPrimrywite,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teacher Name',
                            style: TextStyle(color: kColorPrimrywite),
                          ),
                          const SizedBox(height: 12),
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
                              onChanged: (value) {
                                teacherName = value;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Enter Teacher Name',
                                hintStyle: TextStyle(color: kColorPrimrywite),
                              ),
                              validator: _emailValidator,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Course Name',
                            style: TextStyle(color: kColorPrimrywite),
                          ),
                          const SizedBox(height: 12),
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
                              onChanged: (value) {
                                courseName = value;
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Enter Teacher Name',
                                hintStyle: TextStyle(color: kColorPrimrywite),
                              ),
                              validator: _emailValidator,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                    child: BlocBuilder<TeachersCubit, TeachersState>(
                      builder: (context, state) {
                        return MaterialButton(
                          minWidth: 150,
                          height: 70,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<TeachersCubit>(context)
                                  .addTeacher(
                                      teacherModel: TeacherModel(
                                teacherName: teacherName.toString(),
                                teacherID: generateRandomId(),
                                studentList: [],
                                CourseIDList: [],
                                courseName: courseName.toString(),
                              ));
                              Navigator.pushReplacementNamed(
                                  context, '/Teacher_Screen');
                            }
                          },
                          child: const Text(
                            'Add',
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
