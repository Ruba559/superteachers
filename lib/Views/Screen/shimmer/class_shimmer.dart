import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';

class ClassShimmer extends StatelessWidget {
  const ClassShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.shimmersBase,
        highlightColor: AppColors.shimmersHighlight,
        child:  GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return  Container(
                width: 145,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey, width: 1),
                  borderRadius: radius30,
                ),
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              );
          }),
        ));
  }
}
