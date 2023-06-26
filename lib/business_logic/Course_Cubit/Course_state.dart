part of 'Course_cubit.dart';

@immutable
abstract class CoursesState {}

class AddCoursesInitial extends CoursesState {}

class AddCoursesLoading extends CoursesState {}

class AddCoursesSuccess extends CoursesState {}

class AddCoursesFailure extends CoursesState {
  final String errMessage;

  AddCoursesFailure(this.errMessage);
}

class CourseSuccess extends CoursesState {}

class AddStudentToRegisterSuccess extends CoursesState {}

class AddStudentToCoursestate extends CoursesState {}

class ChangeNumberOfPayToStudentSuccess extends CoursesState {}

class CalculateMoenySuccess extends CoursesState {}

class CoursesSearcheSuccess extends CoursesState {}

class CoursesDeatilsSearcheSuccess extends CoursesState {}

class AddStudentToCourseSearcheSuccess extends CoursesState {}

class ChangeNumberOfPAttendesToStudentSuccess extends CoursesState {}

class calculateDaystate extends CoursesState {}
