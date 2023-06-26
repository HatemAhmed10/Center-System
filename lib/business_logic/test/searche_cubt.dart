import 'package:bloc/bloc.dart';
import 'package:bookstore/business_logic/test/searche_state.dart';

import '../../models/1Teacher_Model/TeacherModel.dart';

class SearchCubit extends Cubit<SearchState> {
  final List<TeacherModel> items;

  SearchCubit({required this.items})
      : super(SearchState(items: items, filteredItems: items));

  void search(String query) {
    final filteredItems = items
        .where((item) =>
            item.teacherName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchState(items: state.items, filteredItems: filteredItems));
  }
}
