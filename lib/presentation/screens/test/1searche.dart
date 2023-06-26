// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../business_logic/test/searche_cubt.dart';
// import '../../../business_logic/test/searche_state.dart';

// class SearchPage extends StatelessWidget {
//   final SearchCubit searchCubit;

//   const SearchPage({required this.searchCubit});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           onChanged: (query) => searchCubit.search(query),
//           decoration: InputDecoration(hintText: 'Search...'),
//         ),
//       ),
//       body: BlocBuilder<SearchCubit, SearchState>(
//         bloc: searchCubit,
//         builder: (context, state) {
//           return ListView.builder(
//             itemCount: state.filteredItems.length,
//             itemBuilder: (context, index) {
//               final item = state.filteredItems[index];
//               return ListTile(
//                 title: Text(item.teacherName),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
