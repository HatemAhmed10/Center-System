// import 'package:bookstore/business_logic/Course_Cubit/Course_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../business_logic/Teacher_Cubit/Teacher_Cubit.dart';
// import '../../../shared/components/constants.dart';

// class SearchCourseDetilsBox extends StatelessWidget {
//   SearchCourseDetilsBox({
//     required this.StudentInformation,
//     Key? key,
//   }) : super(key: key);

//   Map<String, int>? StudentInformation;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(kDefaultPadding),
//       padding: EdgeInsets.symmetric(
//         horizontal: kDefaultPadding,
//         vertical: kDefaultPadding / 4, // 5 top and bottom
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.4),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         onChanged: (query) => BlocProvider.of<CoursesCubit>(context)
//             .searchCoursesDetailsList(items: StudentInformation!, query: query),
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           // icon: SvgPicture.asset("assets/icons/search.svg"),
//           icon: Icon(Icons.search),
//           hintText: 'Search',
//           hintStyle: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
