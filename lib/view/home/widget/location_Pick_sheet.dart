import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';

class LocationPickerModal extends StatelessWidget {
  final String selectedLocation;
  final ValueChanged<String> onLocationSelected;

  const LocationPickerModal({
    super.key,
    required this.selectedLocation,
    required this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final locations = [
      'New Jersey 45463',
      'New York 10001',
      'California 90210',
      'Texas 75001',
      'Florida 33101'
    ];

    return Container(
      height: 400.h,
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Location',
            style: AppTypography.heading3,
          ),
          20.vSpace,
          ...locations.map((location) => GestureDetector(
                onTap: () => onLocationSelected(location),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    location,
                    style: AppTypography.bodyLarge.copyWith(
                      color: location == selectedLocation
                          ? Colors.green
                          : Colors.white,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
