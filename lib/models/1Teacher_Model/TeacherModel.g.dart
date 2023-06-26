// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TeacherModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherModelAdapter extends TypeAdapter<TeacherModel> {
  @override
  final int typeId = 1;

  @override
  TeacherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherModel(
      teacherName: fields[0] as String,
      teacherID: fields[1] as String,
      studentList: (fields[2] as List).cast<dynamic>(),
      CourseIDList: (fields[3] as List).cast<dynamic>(), 
      courseName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TeacherModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.teacherName)
      ..writeByte(1)
      ..write(obj.teacherID)
      ..writeByte(2)
      ..write(obj.studentList)
      ..writeByte(3)
      ..write(obj.CourseIDList)
      ..writeByte(4)
      ..write(obj.courseName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
