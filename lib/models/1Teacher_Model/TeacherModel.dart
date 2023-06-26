import 'package:hive/hive.dart';
// dsadsad
part 'TeacherModel.g.dart';

@HiveType(typeId: 1)
class TeacherModel extends HiveObject {
  @HiveField(0)
  String teacherName;
  @HiveField(1)
  String teacherID;
  @HiveField(2)
  List studentList;
  @HiveField(3)
  List CourseIDList;
  @HiveField(4)
  String courseName;

  TeacherModel({
    required this.teacherName,
    required this.teacherID,
    required this.studentList,
    required this.CourseIDList,
    required this.courseName,
  });
}
