import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_colors.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';

class BuilderInfoSection extends StatelessWidget {
  const BuilderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Builder information',
            style: AppTypography.heading4,
          ),
          16.vSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/image-photo/headshot-portrait-happy-millennial-man-260nw-1548802709.jpg',
                ),
              ),
              12.hSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gregg Schmidt',
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '917-327-8401',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              12.hSpace,
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          30.vSpace
        ],
      ),
    );
  }
}
