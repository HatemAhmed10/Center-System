import 'package:bookstore/business_logic/Teacher_Cubit/Teacher_Cubit.dart';
import 'package:bookstore/models/1Teacher_Model/TeacherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/1cutomshowDialog.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/assets_manager.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    this.itemIndex,
    this.product,
    required this.press,
  }) : super(key: key);

  final int? itemIndex;
  final TeacherModel? product;
  final Function()? press;

  List<String> imagehelpPaths = [
    ImageAssets.help1,
    ImageAssets.help2,
    ImageAssets.help3,
    ImageAssets.help4,
  ];

  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<TeachersCubit, TeachersState>(
      builder: (context, state) {
        TeachersCubit cubit = TeachersCubit.get(context);

        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          // color: Colors.blueAccent,
          height: 160,
          child: InkWell(
            onTap: press,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                // Those are our background
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: itemIndex!.isEven
                        ? kColorPrimrywite
                        : Color(0xFFFFC727),
                    boxShadow: [kDefaultShadow],
                  ),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),

                // our product image
                Positioned(
                  top: 0,
                  right: 0,
                  child: Hero(
                    tag: '${product!.teacherID}',
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      height: 160,
                      // image is square but we add extra 20 + 20 padding thats why width is 200
                      width: 200,
                      child: itemIndex!.isEven
                          ? Image.asset(
                              imagehelpPaths[0],
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              imagehelpPaths[1],
                              fit: BoxFit.cover,
                            ),
                      // child: Image.asset(
                      //   imagehelpPaths[1],
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ),
                // Product title and price
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    height: 136,
                    // our image take 200 width, thats why we set out total width - 200
                    width: size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product!.teacherName,
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: Colors.red.withOpacity(0.2),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CustomshowDialog(
                                            message:
                                                "هل تريد مسح ${product!.teacherName}",
                                            onPressedOK: () {
                                              cubit.DeleteTeacher(
                                                  TeacherID:
                                                      product!.teacherID);

                                              cubit.fetchAllTeachers();
                                            },
                                            onPressedOKCancel: () {},
                                            title: "Attention",
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: kColorPrimrywite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // it use the available space
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5, // 30 padding
                            vertical: kDefaultPadding / 4, // 5 top and bottom
                          ),
                          decoration: BoxDecoration(
                            // color: kSecondaryColor,
                            color: itemIndex!.isEven
                                ? kColorPrimrywite
                                : Color(0xFFFFC727),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Text(
                            "${product!.courseName}",
                            style:
                                TextStyle(color: kBackGroundAny, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
