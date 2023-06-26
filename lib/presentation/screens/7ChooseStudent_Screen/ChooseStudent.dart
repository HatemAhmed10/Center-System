import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../business_logic/Course_Cubit/Course_cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../models/2Course_Model/CourseModel.dart';
import '../../../shared/components/8CustomButton.dart';
import '../../../shared/components/constants.dart';
import '../../widgets/2Teacher/6SearchAddStudentToCourse.dart';
import '../3CoursesScreen/CoursesView.dart';

class ChooseStudent extends StatelessWidget {
  ChooseStudent({Key? key, required this.Courses, required this.teacherModel})
      : super(key: key);

  final CourseModel Courses;
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundAny.withOpacity(0.9),
        appBar: AppBar(
          foregroundColor: kColorPrimrywite,
          backgroundColor: kBackGroundAny,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Choose Student",
            style: TextStyle(
              fontSize: 25,
              color: kColorPrimrywite,
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => CoursesCubit()
            ..AddStudentToRegister(StudentName: "", courseModel: Courses)
            ..searchAddStudentList(items: teacherModel.studentList, query: ""),
          child: BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              List StudentRegister =
                  BlocProvider.of<CoursesCubit>(context).RegisterStudent;
              return Center(
                child: Column(
                  children: [
                    SearchAddStudentToCourse(
                        StudentToAdd: teacherModel.studentList),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 380,
                          color: kBackGroundAny,
                          child: StaggeredGridView.countBuilder(
                            padding: EdgeInsets.all(0),
                            crossAxisCount: 2,
                            itemCount: BlocProvider.of<CoursesCubit>(context)
                                .FStudentToAdd!
                                .length,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(BlocProvider.of<CoursesCubit>(context)
                                      .FStudentToAdd![index]
                                      .toString());
                                  BlocProvider.of<CoursesCubit>(context)
                                      .AddStudentToRegister(
                                          StudentName:
                                              BlocProvider.of<CoursesCubit>(
                                                      context)
                                                  .FStudentToAdd![index]
                                                  .toString(),
                                          courseModel: Courses);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: index.isEven ? 120 : 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          color: index.isEven
                                              ? kColorPrimrywite
                                              : Color(0xFFFFC727),
                                          boxShadow: [kDefaultShadow],
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(22),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // alignment: Alignment.topRight,
                                        padding: EdgeInsets.all(10),
                                        height: index.isEven ? 120 : 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: StudentRegister.contains(
                                                  BlocProvider.of<CoursesCubit>(
                                                          context)
                                                      .FStudentToAdd![index])
                                              ? kColorPrimrywite
                                                  .withOpacity(0.4)
                                              : Colors.white60,
                                        ),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            BlocProvider.of<CoursesCubit>(
                                                    context)
                                                .FStudentToAdd![index]
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kTextColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1),
                          ),
                        ),
                      ),
                    ),

                    // Container(
                    //   height: 300,
                    //   color: kWhiteColor,
                    //   child: ListView.builder(
                    //       physics: const BouncingScrollPhysics(),
                    //       itemCount: BlocProvider.of<CoursesCubit>(context)
                    //           .FStudentToAdd!
                    //           .length,
                    //       padding: const EdgeInsets.symmetric(horizontal: 8),
                    //       itemBuilder: (context, index) {
                    //         return Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 4),
                    //           child: GestureDetector(
                    //             onTap: () {
                    //               print(BlocProvider.of<CoursesCubit>(context)
                    //                   .FStudentToAdd![index]
                    //                   .toString());
                    //               BlocProvider.of<CoursesCubit>(context)
                    //                   .AddStudentToRegister(
                    //                       StudentName:
                    //                           BlocProvider.of<CoursesCubit>(
                    //                                   context)
                    //                               .FStudentToAdd![index]
                    //                               .toString(),
                    //                       courseModel: Courses);
                    //             },
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                   color: StudentRegister.contains(
                    //                           BlocProvider.of<CoursesCubit>(
                    //                                   context)
                    //                               .FStudentToAdd![index])
                    //                       ? kPrimaryColor
                    //                       : kWhiteColor,
                    //                   borderRadius: BorderRadius.circular(16),
                    //                   border: Border.all(
                    //                     color: StudentRegister.contains(
                    //                             BlocProvider.of<CoursesCubit>(
                    //                                     context)
                    //                                 .FStudentToAdd![index])
                    //                         ? kBlackColor
                    //                         : kPrimaryColor,
                    //                     width: 2,
                    //                   )),
                    //               padding: const EdgeInsets.only(
                    //                   left: 16, top: 8, bottom: 8),
                    //               child: ListTile(
                    //                 title: Text(
                    //                   textAlign: TextAlign.right,
                    //                   textDirection: TextDirection.rtl,
                    //                   BlocProvider.of<CoursesCubit>(context)
                    //                       .FStudentToAdd![index]
                    //                       .toString(),
                    //                   style: const TextStyle(
                    //                     fontSize: 20,
                    //                     fontWeight: FontWeight.bold,
                    //                     color: kBlackColor,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         );
                    //       }),
                    // ),

                    const SizedBox(
                      height: 20,
                    ),
                    // const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        ButtonName: "Add Student To Course",
                        onTap: () {
                          BlocProvider.of<CoursesCubit>(context)
                              .AddStudentToCourses(
                                  courseModel: Courses,
                                  RegisterStudent: StudentRegister);
                          Navigator.pushNamed(context, '/Teacher_Screen');

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) {
                          //     return CoursesView(
                          //       teacher: teacherModel,
                          //     );
                          //   }),
                          // );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
