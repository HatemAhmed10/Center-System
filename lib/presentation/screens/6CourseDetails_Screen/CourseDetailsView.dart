import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../business_logic/Course_Cubit/Course_cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../models/2Course_Model/CourseModel.dart';
import '../../../shared/components/1cutomshowDialog.dart';
import '../../../shared/components/4CustomshowToast.dart';
import '../../../shared/components/constants.dart';
import '../../widgets/2Teacher/5SearchCourseDetilsBox.dart';
import '../7ChooseStudent_Screen/ChooseStudent.dart';

class CourseDetailsView extends StatelessWidget {
  CourseDetailsView(
      {Key? key, required this.Course, required this.teacherModel})
      : super(key: key);

  final CourseModel Course;
  final TeacherModel teacherModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesCubit()
        ..fetchAllCourses(TeacherID: teacherModel.teacherID)
        ..calculateDay(number: 0, operation: 'a', courseModel: Course)
        ..CalculateMoeny(courseModel: Course),
      child: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          CoursesCubit cubit = CoursesCubit.get(context);

          List<CourseModel> Courses =
              BlocProvider.of<CoursesCubit>(context).Courses;

          // int numberStudentOfDay = Course.studentPay;
          return Scaffold(
            backgroundColor: kBackGroundAny.withOpacity(0.9),
            // backgroundColor: kPrimaryColor,
            appBar: AppBar(
              foregroundColor: kColorPrimrywite,
              backgroundColor: kBackGroundAny,
              elevation: 0,
              centerTitle: false,
              title: Text(
                'Course Details',
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
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 140,
                          // height: index.isEven ? 120 : 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kColorPrimrywite.withOpacity(0.9),
                            boxShadow: [kDefaultShadow],
                          ),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: kColorPrimrywite,
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),
                        Container(
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kBackGroundAny),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    "نسبة السنتر : ${BlocProvider.of<CoursesCubit>(context).ReasultOfOfficeRate.toString()}",
                                    style: const TextStyle(
                                      color: kColorPrimrywite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    "نسبة المدرس : ${BlocProvider.of<CoursesCubit>(context).ReasultOfTeacherRate.toString()}",
                                    style: const TextStyle(
                                      color: kColorPrimrywite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    "الإجمالي : ${BlocProvider.of<CoursesCubit>(context).ReasultOFPayStudent.toString()}",
                                    style: const TextStyle(
                                      color: kColorPrimrywite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  CircleAvatar(
                                    backgroundColor:
                                        kColorPrimrywite.withOpacity(0.4),
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomshowDialog(
                                              message: "هل تريد مسح حساب اليوم",
                                              onPressedOK: () {
                                                cubit.calculateDay(
                                                    number: cubit
                                                        .numberStudentOfDay,
                                                    operation: "delete",
                                                    courseModel: Course);
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
                                  Spacer(
                                    flex: 13,
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        kColorPrimrywite.withOpacity(0.4),
                                    child: Text(
                                      BlocProvider.of<CoursesCubit>(context)
                                          .numberStudentOfDay
                                          .toString(),
                                      style: TextStyle(
                                        color: kBackGrounBlackdAny,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(
                                    flex: 14,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    "نسبة السنتر : ${BlocProvider.of<CoursesCubit>(context).TotalMoneyOffice.toString()}",
                                    style: const TextStyle(
                                      color: kColorPrimrywite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    "نسبة المدرس : ${BlocProvider.of<CoursesCubit>(context).TotalMoneyTeacher.toString()}",
                                    style: const TextStyle(
                                      color: kColorPrimrywite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    "الإجمالي : ${BlocProvider.of<CoursesCubit>(context).TotalMoneyDay.toString()}",
                                    style: const TextStyle(
                                      color: kColorPrimrywite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        height: 380,
                        // color: Colors.yellow,
                        color: kBackGroundAny,
                        child: StaggeredGridView.countBuilder(
                          padding: EdgeInsets.all(0),
                          crossAxisCount: 1,
                          itemCount: Course.studentInfPay.length,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          itemBuilder: (context, index) {
                            List keys = Course.studentInfPay.keys.toList();
                            List values = Course.studentInfPay.values.toList();

                            List keysAttendes =
                                Course.studentAttend.keys.toList();
                            List valuesAttendes =
                                Course.studentAttend.values.toList();
                            return GestureDetector(
                              // onTap: () {
                              //   showToast(
                              //       state: ToastStates.SUCCESS,
                              //       text: "This Item is Alreade Add");
                              // },
                              child: Container(
                                // alignment: Alignment.topRight,
                                padding: EdgeInsets.all(10),
                                height: index.isEven ? 150 : 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color:
                                        kBackGrounBlackdAny.withOpacity(0.4)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        // color: Colors.red,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Attend",
                                              style: const TextStyle(
                                                color: kColorPrimrywite,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CustomshowDialog(
                                                        message:
                                                            "هل تريد تحضير ${keys[index].toString()}",
                                                        onPressedOK: () {
                                                          valuesAttendes[
                                                                  index] =
                                                              valuesAttendes[
                                                                      index] +
                                                                  1;

                                                          cubit.ChangeNumberOfAttendesToStuden(
                                                              Keys:
                                                                  keysAttendes,
                                                              Values:
                                                                  valuesAttendes,
                                                              courseModel:
                                                                  Course);
                                                        },
                                                        onPressedOKCancel:
                                                            () {},
                                                        title: "Attention",
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(Icons.expand_less),
                                              ),
                                            ),
                                            Expanded(
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    kColorPrimrywite
                                                        .withOpacity(0.4),
                                                child: Text(
                                                  valuesAttendes[index]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: kBackGrounBlackdAny,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CustomshowDialog(
                                                        message:
                                                            " هل تريد مسح ${keys[index].toString()} من الحضور ",
                                                        onPressedOK: () {
                                                          if (valuesAttendes[
                                                                  index] ==
                                                              0) {
                                                            showToast(
                                                                state:
                                                                    ToastStates
                                                                        .WARNING,
                                                                text:
                                                                    "لا يوجد حضور حتي الان");
                                                          } else {
                                                            valuesAttendes[
                                                                    index] =
                                                                valuesAttendes[
                                                                        index] -
                                                                    1;

                                                            cubit.ChangeNumberOfAttendesToStuden(
                                                                Keys:
                                                                    keysAttendes,
                                                                Values:
                                                                    valuesAttendes,
                                                                courseModel:
                                                                    Course);
                                                          }
                                                        },
                                                        onPressedOKCancel:
                                                            () {},
                                                        title: "Attention",
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.expand_more,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        // color: Colors.yellow,
                                        alignment: Alignment.center,
                                        child: Text(
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          "${keys[index].toString()} ",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: kColorPrimrywite,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        // color: Colors.red,
                                        child: Column(
                                          children: [
                                            Text(
                                              "pay",
                                              style: const TextStyle(
                                                color: kColorPrimrywite,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CustomshowDialog(
                                                        message:
                                                            "   هل تريد الدفع ل ${keys[index].toString()}",
                                                        onPressedOK: () {
                                                          values[index] =
                                                              values[index] + 1;

                                                          cubit.calculateDay(
                                                              number: cubit
                                                                  .numberStudentOfDay,
                                                              operation: "add",
                                                              courseModel:
                                                                  Course);
                                                          cubit
                                                              .ChangeNumberOfPayToStudent(
                                                                  Keys: keys,
                                                                  Values:
                                                                      values,
                                                                  courseModel:
                                                                      Course);
                                                          cubit.CalculateMoeny(
                                                              courseModel:
                                                                  Course);
                                                        },
                                                        onPressedOKCancel:
                                                            () {},
                                                        title: "Attention",
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(Icons.expand_less),
                                              ),
                                            ),
                                            Expanded(
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    kColorPrimrywite
                                                        .withOpacity(0.4),
                                                child: Text(
                                                  "${values[index].toString()}",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: kBackGrounBlackdAny,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return CustomshowDialog(
                                                        message:
                                                            "   هل تريد التراجع في الدفع ل ${keys[index].toString()}",
                                                        onPressedOK: () {
                                                          if (values[index] ==
                                                              0) {
                                                            showToast(
                                                                state:
                                                                    ToastStates
                                                                        .SUCCESS,
                                                                text:
                                                                    "لا يوجد دفع حتي الان");
                                                          } else {
                                                            if (values[index] !=
                                                                0) {
                                                              values[index] =
                                                                  values[index] -
                                                                      1;
                                                              cubit.calculateDay(
                                                                  number: cubit
                                                                      .numberStudentOfDay,
                                                                  operation:
                                                                      "min",
                                                                  courseModel:
                                                                      Course);
                                                              cubit.ChangeNumberOfPayToStudent(
                                                                  Keys: keys,
                                                                  Values:
                                                                      values,
                                                                  courseModel:
                                                                      Course);
                                                              cubit.CalculateMoeny(
                                                                  courseModel:
                                                                      Course);
                                                            }
                                                          }
                                                        },
                                                        onPressedOKCancel:
                                                            () {},
                                                        title: "Attention",
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.expand_more,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kColorPrimrywite.withOpacity(0.4),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ChooseStudent(
                      Courses: Course,
                      teacherModel: teacherModel,
                    );
                  }),
                );
              },
              child: const Icon(
                Icons.add,
                color: kBackGrounBlackdAny,
              ),
            ),
          );
        },
      ),
    );
  }
}
