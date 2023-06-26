import '../../models/1Teacher_Model/TeacherModel.dart';

class SearchState {
  final List<TeacherModel> items;
  final List<TeacherModel> filteredItems;

  SearchState({required this.items, required this.filteredItems});
}
