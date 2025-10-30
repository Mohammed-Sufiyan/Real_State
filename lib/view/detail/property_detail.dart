import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_colors.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/view/detail/widget/buildInfo.dart';
import 'package:real_estate/view/detail/widget/detail_AppBar.dart';
import 'package:real_estate/view/detail/widget/floorPlane.dart';
import 'package:real_estate/view/home/widget/gradient.dart';

class PropertyDetailScreen extends StatefulWidget {
  final PropertyModel property;

  const PropertyDetailScreen({super.key, required this.property});

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GradientWidget(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              DetailAppBar(
                property: widget.property,
                onFavoriteToggle: () {
                  setState(() {
                    widget.property.isFavorite = !widget.property.isFavorite;
                  });
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPropertyMainImage(widget.property),
                      _buildPropertyInfoSection(widget.property),
                      _buildActionButtonsSection(widget.property),
                      if (widget.property.floorPlanImages != null)
                        FloorPlanSection(property: widget.property),
                      BuilderInfoSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPropertyMainImage(PropertyModel property) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image.network(
          property.imageUrl,
          height: 300.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        bottom: 16.h,
        left: 16.w,
        child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 16.sp,
              ),
              4.hSpace,
              Text(
                'Street View',
                style: AppTypography.bodySmall.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildPropertyInfoSection(PropertyModel property) {
  return Padding(
    padding: EdgeInsets.all(20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              CupertinoIcons.placemark,
              color: Colors.grey[500],
              size: 16.sp,
            ),
            4.hSpace,
            Text(
              property.location,
              style: AppTypography.bodySmall,
            ),
          ],
        ),
        8.vSpace,
        Row(
          children: [
            Text(
              '${property.price}${property.priceType}',
              style: AppTypography.priceDetail.copyWith(
                color: AppColors.primary,
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                'Verified On: 12/12/24',
                style: AppTypography.caption.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
        12.vSpace,
        Text(
          property.title,
          style: AppTypography.heading3,
        ),
      ],
    ),
  );
}

Widget _buildActionButtonsSection(PropertyModel property) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      children: [
        Expanded(
          child: const ActionButton(
            title: '2 floors',
            icon: Icons.villa,
          ),
        ),
        12.hSpace,
        Expanded(
          child: ActionButton(
            title: '${property.bathrooms} Brs',
            icon: Icons.bathtub,
          ),
        ),
        12.hSpace,
        Expanded(
          child: ActionButton(
            title: '${property.sqFeet} Sqy',
            icon: Icons.square_foot,
          ),
        ),
      ],
    ),
  );
}

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const ActionButton({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
              color: Colors.grey[800]!,
              width: 1.w,
              strokeAlign: BorderSide.strokeAlignOutside),
        ),
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24.sp,
          ),
          8.vSpace,
          Text(
            title,
            style: AppTypography.bodySmall.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
