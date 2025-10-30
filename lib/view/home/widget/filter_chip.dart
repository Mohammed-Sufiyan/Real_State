import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';

class FilterChipsWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onFilterChanged;

  const FilterChipsWidget({
    super.key,
    required this.selectedIndex,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'label': 'All', 'icon': Icons.apps},
      {'label': 'House', 'icon': CupertinoIcons.home},
      {'label': 'Ready to move', 'icon': Icons.local_post_office},
      {'label': 'Prime', 'icon': Icons.star},
      {'label': 'Apartment', 'icon': Icons.apartment},
      {'label': 'Villa', 'icon': Icons.villa},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> filter = entry.value;

          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 20.w : 0,
                right: index < filters.length - 1 ? 12.w : 0),
            child: FilterChip(
              label: filter['label'],
              icon: filter['icon'],
              isSelected: selectedIndex == index,
              onTap: () => onFilterChanged(index),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? Colors.white : Colors.grey.withValues(alpha: .3),
            width: isSelected ? 1.5.w : 1.w,
          ),
          color: isSelected ? Colors.white : Colors.grey[800],
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white,
              size: 16.sp,
            ),
            8.hSpace,
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
