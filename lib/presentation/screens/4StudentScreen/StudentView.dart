import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/Teacher_Cubit/Teacher_Cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/1cutomshowDialog.dart';
import '../../../shared/components/4CustomshowToast.dart';
import '../../../shared/components/8CustomButton.dart';
import '../../../shared/components/constants.dart';
import '../../widgets/2Teacher/1SearchBox.dart';
import '../../widgets/2Teacher/3SearchBox2.dart';
import '../2Teacher_Screen/Teacher_Screen.dart';

class StudentView extends StatelessWidget {
  StudentView({Key? key, required this.teacher}) : super(key: key);

  final TeacherModel teacher;
  String? StudentName;
  TextEditingController StudentNameControlle = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TeachersCubit()..searchList2(items: teacher.studentList, query: ""),
      child: Scaffold(
        backgroundColor: kBackGroundAny.withOpacity(0.9),
        // backgroundColor: Colors.yellow,
        appBar: AppBar(
          foregroundColor: kColorPrimrywite,
          backgroundColor: kBackGroundAny,
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Student',
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
            TeachersCubit cubit = TeachersCubit.get(context);
            return Form(
              key: formKey,
              child: Column(
                children: [
                  SearchBox2(teacher: teacher),
                  SizedBox(height: kDefaultPadding / 2),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: BlocProvider.of<TeachersCubit>(context)
                              .FStudent
                              .length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kBackGrounBlackdAny.withOpacity(0.4),
                                  border: Border.all(
                                    color: kColorPrimrywite,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 16, top: 24, bottom: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                        BlocProvider.of<TeachersCubit>(context)
                                            .FStudent[index]
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: kColorPrimrywite),
                                      ),
                                      leading: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomshowDialog(
                                                message:
                                                    " ${cubit.FStudent[index].toString()}  هل تريد مسح",
                                                onPressedOK: () {
                                                  // // teacher.studentList.removeAt(index);
                                                  teacher.studentList.remove(
                                                      cubit.FStudent[0]
                                                          .toString());

                                                  cubit.FStudent =
                                                      teacher.studentList;

                                                  cubit.UpdateTeacher(
                                                      TeacherID:
                                                          teacher.teacherID,
                                                      teacherModel: teacher);

                                                  cubit.searchList2(
                                                      items:
                                                          teacher.studentList,
                                                      query: "");
                                                },
                                                onPressedOKCancel: () {},
                                                title: "Attention",
                                              );
                                            },
                                          );

                                          // // // teacher.studentList.removeAt(index);
                                          // teacher.studentList.remove(
                                          //     BlocProvider.of<TeachersCubit>(
                                          //             context)
                                          //         .FStudent[0]
                                          //         .toString());

                                          // BlocProvider.of<TeachersCubit>(
                                          //         context)
                                          //     .FStudent = teacher.studentList;

                                          // BlocProvider.of<TeachersCubit>(
                                          //         context)
                                          //     .UpdateTeacher(
                                          //         TeacherID: teacher.teacherID,
                                          //         teacherModel: teacher);

                                          // BlocProvider.of<TeachersCubit>(
                                          //         context)
                                          //     .searchList2(
                                          //         items: teacher.studentList,
                                          //         query: "");
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: kColorPrimrywite,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 9),
                          blurRadius: 32,
                          color: const Color(0xFF087949).withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 0.75,
                              ),
                              decoration: BoxDecoration(
                                color: kColorPrimryBold.withOpacity(0.09),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: kColorPrimryBold.withOpacity(0.64),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  const SizedBox(width: kDefaultPadding / 4),
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor: kColorPrimrywite,
                                      style: TextStyle(color: kColorPrimrywite),
                                      controller: StudentNameControlle,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter Name";
                                        }
                                        return null;
                                      },
                                      // onChanged: (value) {
                                      //   StudentName = value;
                                      // },
                                      decoration: InputDecoration(
                                        hintText: "Student Name",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: kDefaultPadding),
                          InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                if (teacher.studentList.contains(
                                    StudentNameControlle.text.toLowerCase())) {
                                  showToast(
                                      state: ToastStates.WARNING,
                                      text: "This Student is Found");
                                } else {
                                  teacher.studentList.add(
                                      StudentNameControlle.text.toLowerCase());
                                  BlocProvider.of<TeachersCubit>(context)
                                      .UpdateTeacher(
                                          TeacherID: teacher.teacherID,
                                          teacherModel: teacher);
                                  BlocProvider.of<TeachersCubit>(context)
                                      .searchList2(
                                          items: teacher.studentList,
                                          query: "");
                                  StudentNameControlle.clear();
                                }
                              }
                            },
                            child: CircleAvatar(
                                backgroundColor: kColorPrimrywite,
                                child: Icon(Icons.send,
                                    color: kBackGrounBlackdAny)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
