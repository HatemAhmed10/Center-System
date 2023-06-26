import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/Course_Cubit/Course_cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../models/2Course_Model/CourseModel.dart';
import '../../../shared/components/1cutomshowDialog.dart';
import '../../../shared/components/constants.dart';
import '../../widgets/2Teacher/4SearchBox3.dart';
import '../4StudentScreen/StudentView.dart';
import '../5AddCourse_Screen/AddCoursesView.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../6CourseDetails_Screen/CourseDetailsView.dart';

class CoursesView extends StatelessWidget {
  CoursesView({Key? key, required this.teacher}) : super(key: key);

  final TeacherModel teacher;
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomNumber = random.nextInt(5);
    return BlocProvider(
      create: (context) =>
          CoursesCubit()..fetchAllCourses(TeacherID: teacher.teacherID),
      child: Scaffold(
        backgroundColor: kBackGroundAny.withOpacity(0.9),
        appBar: AppBar(
          foregroundColor: kColorPrimrywite,
          elevation: 0,
          centerTitle: false,
          backgroundColor: kBackGroundAny,
          title: Text(
            teacher.teacherName.toString(),
            style: TextStyle(
              fontSize: 15,
              color: kColorPrimrywite,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return StudentView(
                      teacher: teacher,
                    );
                  }),
                );
              },
              icon: const Icon(
                Icons.people,
                size: 28,
                color: kBackGrounBlackdAny,
              ),
            ),
            SizedBox(
              width: 20,
            ),
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
        body: BlocBuilder<CoursesCubit, CoursesState>(
          builder: (context, state) {
            CoursesCubit cubit = CoursesCubit.get(context);

            List<CourseModel> Courses =
                BlocProvider.of<CoursesCubit>(context).FCourses!;
            return Column(
              children: [
                SearchBox3(),
                SizedBox(height: kDefaultPadding / 2),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(0),
                    crossAxisCount: 2,
                    itemCount: Courses.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return CourseDetailsView(
                                Course: Courses[index],
                                teacherModel: teacher,
                              );
                            }),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  height: index.isEven ? 170 : 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: index.isEven
                                        ? kColorPrimrywite
                                        : Color(0xFFFFC727),
                                    boxShadow: [kDefaultShadow],
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(20),
                                  height: index.isEven ? 170 : 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: kBackGroundAny,
                                    // image: DecorationImage(
                                    //   image:
                                    //       AssetImage(CoursesimagePaths[randomNumber]),
                                    //   fit: BoxFit.fill,
                                    // ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    Courses[index].CourseName,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: kColorPrimrywite,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    '${Courses[index].CoursestudentList.length} Student',
                                                    style: TextStyle(
                                                      color: kColorPrimrywite
                                                          .withOpacity(.5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: CircleAvatar(
                                            backgroundColor: kColorPrimrywite
                                                .withOpacity(0.2),
                                            child: IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return CustomshowDialog(
                                                      message:
                                                          "هل تريد مسح ${Courses[index].CourseName} ",
                                                      onPressedOK: () {
                                                        cubit.DeleteCourses(
                                                            TeacherID: teacher
                                                                .teacherID,
                                                            CoursesID:
                                                                Courses[index]
                                                                    .CourseID);
                                                      },
                                                      onPressedOKCancel: () {},
                                                      title: "Attention",
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: kBackGrounBlackdAny,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kColorPrimrywite.withOpacity(0.4),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return AddCoursesView(
                  teacher: teacher,
                );
              }),
            );
          },
          child: const Icon(
            size: 30,
            Icons.add,
            color: kBackGrounBlackdAny,
          ),
        ),
      ),
    );
  }
}
