import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';

class SortOptionsModal extends StatelessWidget {
  const SortOptionsModal({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      'Price: Low to High',
      'Price: High to Low',
      'Newest First',
      'Most Popular'
    ];

    return Container(
      height: 400.h,
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sort By',
            style: AppTypography.heading3,
          ),
          20.vSpace,
          ...options.map((option) => GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    option,
                    style: AppTypography.bodyLarge,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
