import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/constants.dart';
import '../../shared/components/4CustomshowToast.dart';

part 'Teacher_State.dart';

class TeachersCubit extends Cubit<TeachersState> {
  TeachersCubit() : super(TeachersInitial());

  static TeachersCubit get(context) => BlocProvider.of(context);

  List<TeacherModel>? Teachers;
  List<TeacherModel>? FTeachers;

  fetchAllTeachers() {
    var LessonBox = Hive.box<TeacherModel>(kTeacherBox);

    Teachers = LessonBox.values.toList();
    FTeachers = Teachers;
    emit(TeachersSuccess());
  }

  void searchList({required List<TeacherModel> items, required String query}) {
    FTeachers = items
        .where((item) =>
            item.teacherName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(TeachersSearcheSuccess());
  }

  late List FStudent;
  void searchList2({required List items, required String query}) {
    FStudent = items;
    print(items.toString());

    FStudent = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    print(FStudent.toString());
    emit(TeachersSearcheSuccess());
  }
  // ___________________________________________________________
  //Get

  List<TeacherModel>? TeacherList;
  bool ItemFound = false;

  addTeacher({required TeacherModel teacherModel}) async {
    emit(AddTeacherLoading());
    TeacherList = [];

    var teacherBox = Hive.box<TeacherModel>(kTeacherBox);

    TeacherList = teacherBox.values.toList();

    TeacherList!.forEach((element) {
      if (element.teacherName == teacherModel.teacherName) {
        ItemFound = true;
      }
    });

    if (ItemFound == false) {
      try {
        var teacherBox2 = Hive.box<TeacherModel>(kTeacherBox);
        await teacherBox2.add(teacherModel);
        // showToast(state: ToastStates.SUCCESS, text: "Good Add");
        fetchAllTeachers();
        emit(AddTeacherSuccess());
      } catch (e) {
        emit(AddTeacherFailure(e.toString()));
      }
    } else {
      // showToast(state: ToastStates.SUCCESS, text: "This Item is Alreade Add");
    }
  }
  // ___________________________________________________________
  // Update

  List<TeacherModel>? TeachersList;
  TeacherModel? OneTeacherModel;
  bool itemFound = false;
  TeacherModel NotFountModel = TeacherModel(
    teacherID: "",
    courseName: "",
    studentList: [],
    teacherName: "",
    CourseIDList: [],
  );

  UpdateTeacher(
      {required String TeacherID, required TeacherModel teacherModel}) async {
    TeachersList = [];
    var teacherBox = Hive.box<TeacherModel>(kTeacherBox);
    TeachersList = teacherBox.values.toList();
    OneTeacherModel = TeachersList!.firstWhere(
      (item) => item.teacherID == TeacherID.toString(),
      orElse: () => NotFountModel,
    );
    if (OneTeacherModel!.teacherID == "") {
      // showToast(state: ToastStates.SUCCESS, text: "Not Found");
    } else {
      await teacherBox.put(OneTeacherModel!.key, teacherModel);
      fetchAllTeachers();
      // showToast(state: ToastStates.SUCCESS, text: "Update Done");
    }
  }

  // ___________________________________________________________
  // delete Item

  List<TeacherModel>? teacherList;
  TeacherModel? OneTeacher;

  DeleteTeacher({required String TeacherID}) async {
    teacherList = [];
    var LessonBox = Hive.box<TeacherModel>(kTeacherBox);
    teacherList = LessonBox.values.toList();
    OneTeacher = teacherList!.firstWhere(
      (item) => item.teacherID == TeacherID.toString(),
      orElse: () => NotFountModel,
    );
    await LessonBox.delete(OneTeacher!.key);
    // showToast(state: ToastStates.SUCCESS, text: "Delete Done");
  }
}
