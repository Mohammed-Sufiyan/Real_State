import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Real Estate',
              textAlign: TextAlign.center,
              style: AppTypography.heading3,
            ),
          ),
          10.hSpace,
        ],
      ),
    );
  }
}
