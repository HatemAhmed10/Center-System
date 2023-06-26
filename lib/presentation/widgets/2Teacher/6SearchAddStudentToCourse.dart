import 'package:bookstore/business_logic/Course_Cubit/Course_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../business_logic/Teacher_Cubit/Teacher_Cubit.dart';
import '../../../shared/components/constants.dart';

class SearchAddStudentToCourse extends StatelessWidget {
  SearchAddStudentToCourse({Key? key, required this.StudentToAdd})
      : super(key: key);

  final List StudentToAdd;
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
        onChanged: (query) => BlocProvider.of<CoursesCubit>(context)
            .searchAddStudentList(items: StudentToAdd, query: query),
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
