import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'items_card.dart';


class searchItems extends StatelessWidget {
  const searchItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         ListView.builder(
           itemCount: 5,
           shrinkWrap: true,
           scrollDirection: Axis.vertical,
           physics: const BouncingScrollPhysics(),
             itemBuilder: (context, index) => Padding(
      padding: EdgeInsets.only(bottom: 22.h, left: 10.h),
      child: const itemcard(),
    ),
    )
       ],

    );
  }
}
