import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';
import 'package:real_estate/gen/assets.gen.dart';

import '../../../const/app_typography.dart';

class NoPropertyFoundWidget extends StatelessWidget {
  const NoPropertyFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          100.vSpace,
          Image.asset(
            Assets.images.notFound.path,
            height: 180.h,
          ),
          10.vSpace,
          Text(
            'No properties found',
            style: AppTypography.bodyLarge.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
