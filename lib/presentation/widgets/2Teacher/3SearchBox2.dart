import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../business_logic/Teacher_Cubit/Teacher_Cubit.dart';
import '../../../models/1Teacher_Model/TeacherModel.dart';
import '../../../shared/components/constants.dart';

class SearchBox2 extends StatelessWidget {
  SearchBox2({Key? key, required this.teacher}) : super(key: key);

  final TeacherModel teacher;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4, // 5 top and bottom
      ),
      decoration: BoxDecoration(
        color: kBackGrounBlackdAny.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: (query) => BlocProvider.of<TeachersCubit>(context)
            .searchList2(items: teacher.studentList, query: query),
        style: TextStyle(color: kColorPrimrywite),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // icon: SvgPicture.asset("assets/icons/search.svg"),
          icon: Icon(
            Icons.search,
            color: kColorPrimrywite,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: kColorPrimrywite),
        ),
      ),
    );
  }
}
