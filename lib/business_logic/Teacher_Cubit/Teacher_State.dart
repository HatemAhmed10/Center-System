part of 'Teacher_Cubit.dart';

@immutable
abstract class TeachersState {}

class TeachersInitial extends TeachersState {}

class TeachersSuccess extends TeachersState {}

class AddTeacherLoading extends TeachersState {}

class AddTeacherSuccess extends TeachersState {}

class AddTeacherFailure extends TeachersState {
  final String errMessage;

  AddTeacherFailure(this.errMessage);
}

class TeachersSearcheSuccess extends TeachersState {}

class changenumberofimgstate extends TeachersState {}
