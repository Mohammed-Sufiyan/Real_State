import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';
import 'package:real_estate/gen/assets.gen.dart';
import 'package:real_estate/view/home/widget/glassmorphism.dart';

class LocationSearchWidget extends StatelessWidget {
  final String selectedLocation;
  final VoidCallback onLocationTap;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSortTap;

  const LocationSearchWidget({
    super.key,
    required this.selectedLocation,
    required this.onLocationTap,
    required this.onSearchChanged,
    required this.onSortTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: AppTypography.bodyLarge,
          ),
          5.vSpace,
          Row(
            children: [
              GestureDetector(
                onTap: onLocationTap,
                child: Row(
                  children: [
                    Text(
                      selectedLocation,
                      style: AppTypography.bodyLarge,
                    ),
                    8.hSpace,
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          16.vSpace,
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 68, 76, 66),
                        Colors.black87,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.grey[600]!.withValues(alpha: 0.5),
                      width: 1.r,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.9),
                        blurRadius: 3.r,
                        offset: Offset(1, 2.h),
                      ),
                    ],
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: TextField(
                    cursorColor: Colors.white,
                    onChanged: onSearchChanged,
                    style: AppTypography.bodyMedium,
                    decoration: InputDecoration(
                      hintText: 'Search Home',
                      hintStyle:
                          AppTypography.bodySmall.copyWith(color: Colors.white),
                      prefixIcon: Icon(CupertinoIcons.search,
                          color: Colors.white, size: 20.sp),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                    ),
                  ),
                ),
              ),
              5.hSpace,
              Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 68, 76, 66),
                        Colors.black87,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.grey[600]!.withValues(alpha: 0.5),
                      width: 1.r,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.9),
                        blurRadius: 3.r,
                        offset: Offset(1, 2.h),
                      ),
                    ],
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: IconButton(
                      onPressed: onSortTap,
                      icon: Transform.rotate(
                        angle: 1.55,
                        child: Image.asset(
                          Assets.icons.filter.path,
                          color: Colors.white,
                          width: 25.w,
                        ),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
