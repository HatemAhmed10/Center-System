import 'package:bloc/bloc.dart';
import 'package:bookstore/models/2Course_Model/CourseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../shared/components/4CustomshowToast.dart';
import '../../shared/components/constants.dart';

part 'Course_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(AddCoursesInitial());
  static CoursesCubit get(context) => BlocProvider.of(context);

  List<CourseModel>? Courses1 = [];
  List<CourseModel> Courses = [];
  List<CourseModel>? FCourses;

  fetchAllCourses({required String TeacherID}) {
    Courses = [];
    Courses1 = [];
    var CourseBox2 = Hive.box<CourseModel>(kCourseBox);
    Courses1 = CourseBox2.values.toList();
    Courses = Courses1!.where((item) => item.TeacherId == TeacherID).toList();
    FCourses = Courses;

    emit(CourseSuccess());
  }

  void searchCoursesList(
      {required List<CourseModel> items, required String query}) {
    FCourses = items
        .where((item) =>
            item.CourseName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(CoursesSearcheSuccess());
  }

  List<String>? TestList;
  Map<String, int>? FStudentInf;

//____________________________________________________
//ADD
  List<CourseModel>? CourseList;
  bool ItemFound = false;

  addCourse(
      {required CourseModel courseModel, required String TeacherID}) async {
    emit(AddCoursesLoading());
    CourseList = [];

    var teacherBox = Hive.box<CourseModel>(kCourseBox);

    CourseList = teacherBox.values.toList();

    CourseList!.forEach((element) {
      if (element.CourseID == courseModel.CourseID) {
        ItemFound = true;
      }
    });

    if (ItemFound == false) {
      try {
        var CourseBox2 = Hive.box<CourseModel>(kCourseBox);
        await CourseBox2.add(courseModel);
        // showToast(state: ToastStates.SUCCESS, text: "Good Add");
        fetchAllCourses(TeacherID: TeacherID);
        emit(AddCoursesSuccess());
      } catch (e) {
        emit(AddCoursesFailure(e.toString()));
      }
    } else {
      // showToast(state: ToastStates.SUCCESS, text: "This Item is Alreade Add");
    }
  }
  //_______________________________________________________
  // Delete

  List<CourseModel>? Courses2;
  CourseModel? OneCourses;

  DeleteCourses({required String CoursesID, required String TeacherID}) async {
    Courses2 = [];
    var LessonBox = Hive.box<CourseModel>(kCourseBox);
    Courses2 = LessonBox.values.toList();
    OneCourses = Courses2!.firstWhere(
      (item) => item.CourseID == CoursesID.toString(),
    );
    await LessonBox.delete(OneCourses!.key);
    fetchAllCourses(TeacherID: TeacherID);

    // showToast(state: ToastStates.SUCCESS, text: "Delete Done");
  }

  ///_________________________________________________________________

  List RegisterStudent = [];

  void AddStudentToRegister(
      {required String StudentName, required CourseModel courseModel}) {
    RegisterStudent = courseModel.CoursestudentList;

    if (StudentName == "") {
    } else {
      if (RegisterStudent.contains(StudentName)) {
        RegisterStudent.remove(StudentName.toString());
      } else {
        RegisterStudent.add(StudentName);
      }
    }
    emit(AddStudentToRegisterSuccess());
  }

  //___________________________________________________________
  // Add Syudent To Course
  Map<String, int> StudentInformation = {};
  Map<String, int> StudentAttendes = {};

  void AddStudentToCourses(
      {required CourseModel courseModel, required List RegisterStudent}) {
    if (courseModel.CoursestudentList.length >
        courseModel.studentInfPay.length) {
      for (int x = courseModel.studentInfPay.length;
          x < courseModel.CoursestudentList.length;
          x++) {
        courseModel.studentInfPay.addAll({courseModel.CoursestudentList[x]: 0});
        courseModel.studentAttend.addAll({courseModel.CoursestudentList[x]: 0});
      }
      UpdateCourses(CoursesID: courseModel.CourseID, Courses: courseModel);
    } else if (courseModel.CoursestudentList.length <
        courseModel.studentInfPay.length) {
      courseModel.studentInfPay.forEach((key, value) {
        if (courseModel.CoursestudentList.contains(key)) {
          StudentInformation.addAll({key: value});
        } else {
          print("no" + value.toString());
        }
      });
      courseModel.studentAttend.forEach((key, value) {
        if (courseModel.CoursestudentList.contains(key)) {
          StudentAttendes.addAll({key: value});
        } else {
          print("no" + value.toString());
        }
      });
      courseModel.studentInfPay = StudentInformation;
      courseModel.studentAttend = StudentAttendes;

      UpdateCourses(CoursesID: courseModel.CourseID, Courses: courseModel);
    }
    // courseModel.studentInfPay.forEach((key, value) {
    //   courseModel.studentAttend.addAll({key: 0});
    // });
    // UpdateCourses(CoursesID: courseModel.CourseID, Courses: courseModel);

    emit(AddStudentToCoursestate());
  }

  Map<String, int> FinalStudentInformation = {};
  void ChangeNumberOfPayToStudent(
      {required List Keys,
      required List Values,
      required CourseModel courseModel}) {
    for (int x = 0; x < Values.length; x++) {
      FinalStudentInformation.addAll({Keys[x].toString(): Values[x]});
    }
    courseModel.studentInfPay = FinalStudentInformation;
    UpdateCourses(CoursesID: courseModel.CourseID, Courses: courseModel);
    emit(ChangeNumberOfPayToStudentSuccess());
  }

  Map<String, int> FinalStudentAttendes = {};
  void ChangeNumberOfAttendesToStuden(
      {required List Keys,
      required List Values,
      required CourseModel courseModel}) {
    for (int x = 0; x < Values.length; x++) {
      FinalStudentAttendes.addAll({Keys[x].toString(): Values[x]});
    }
    courseModel.studentAttend = FinalStudentAttendes;
    UpdateCourses(CoursesID: courseModel.CourseID, Courses: courseModel);
    emit(ChangeNumberOfPAttendesToStudentSuccess());
  }

//________________________________________________________________
  // Calculate Dat

  int numberStudentOfDay = 0;
  double TotalMoneyDay = 0;
  double TotalMoneyTeacher = 0;
  double TotalMoneyOffice = 0;

  void calculateDay(
      {required int number,
      required String operation,
      required CourseModel courseModel}) {
    if (operation == 'a') {
      numberStudentOfDay = courseModel.studentPay;
    } else if (operation == "add") {
      numberStudentOfDay = numberStudentOfDay + 1;
    } else if (operation == "min") {
      numberStudentOfDay = numberStudentOfDay - 1;
    } else if (operation == "delete") {
      numberStudentOfDay = 0;
    }
    courseModel.studentPay = numberStudentOfDay;
    UpdateCourses(CoursesID: courseModel.CourseID, Courses: courseModel);

    TotalMoneyDay = numberStudentOfDay * double.parse(courseModel.CoursePrice);
    TotalMoneyTeacher =
        numberStudentOfDay * double.parse(courseModel.teacherRate);
    TotalMoneyOffice =
        numberStudentOfDay * double.parse(courseModel.officeRate);

    emit(calculateDaystate());
  }
  // ___________________________________________________________
  // Update

  List<CourseModel>? CourseList2;
  CourseModel? OneCoursesModel;

  UpdateCourses(
      {required String CoursesID, required CourseModel Courses}) async {
    CourseList2 = [];
    var LessonBox = Hive.box<CourseModel>(kCourseBox);
    CourseList2 = LessonBox.values.toList();
    OneCoursesModel = CourseList2!.firstWhere(
      (item) => item.CourseID == CoursesID.toString(),
    );

    await LessonBox.put(OneCoursesModel!.key, Courses);
    // showToast(state: ToastStates.SUCCESS, text: "Update Done");
  }

  double ReasultOFPayStudent = 0;
  double ReasultOfOfficeRate = 0;
  double ReasultOfTeacherRate = 0;
  void CalculateMoeny({required CourseModel courseModel}) {
    double NumberOfStudentpay = 0;
    courseModel.studentInfPay.forEach((key, value) {
      NumberOfStudentpay = NumberOfStudentpay + value;
    });
    ReasultOFPayStudent =
        NumberOfStudentpay * int.parse(courseModel.CoursePrice);

    ReasultOfOfficeRate =
        (int.parse(courseModel.officeRate) * NumberOfStudentpay);

    ReasultOfTeacherRate =
        (int.parse(courseModel.teacherRate) * NumberOfStudentpay);

    emit(CalculateMoenySuccess());
  }

  //______________________________________________________
  // searche in Add Syudent
  List? FStudentToAdd = [];

  void searchAddStudentList({required List items, required String query}) {
    FStudentToAdd = items;
    FStudentToAdd = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print("FStudentToAdd" + FStudentToAdd.toString());
    emit(AddStudentToCourseSearcheSuccess());
  }
}
