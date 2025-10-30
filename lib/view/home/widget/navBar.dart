import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildNavItem(
            index: 0,
            icon: CupertinoIcons.hammer,
            activeIcon: CupertinoIcons.hammer_fill,
            isActive: currentIndex == 0,
          ),
          _buildNavItem(
            index: 1,
            icon: CupertinoIcons.calendar,
            activeIcon: CupertinoIcons.calendar,
            isActive: currentIndex == 1,
          ),
          _buildCenterAddButton(),
          _buildNavItem(
            index: 3,
            icon: Icons.bookmark_border,
            activeIcon: Icons.bookmark,
            isActive: currentIndex == 3,
          ),
          _buildNavItem(
            index: 4,
            icon: CupertinoIcons.person,
            activeIcon: Icons.person,
            isActive: currentIndex == 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1),
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withValues(alpha: .1)),
          color: isActive ? Colors.white : Colors.grey.withValues(alpha: .2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isActive ? activeIcon : icon,
          color: isActive ? Colors.black : Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _buildCenterAddButton() {
    return GestureDetector(
      onTap: () => onTap(2),
      child: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB8FF00).withValues(alpha: 0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 28.sp,
          weight: 600,
        ),
      ),
    );
  }
}
