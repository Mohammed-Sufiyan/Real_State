import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/const/app_colors.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';
import 'package:real_estate/gen/assets.gen.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/view/detail/property_detail.dart';
import 'package:real_estate/view/home/widget/glassmorphism.dart';
import 'package:real_estate/view/home/widget/main_property_ImageCard.dart';
import 'package:real_estate/view/home/widget/property_not_found.dart';

class PropertyListWidget extends StatelessWidget {
  final List<PropertyModel> properties;
  final Function(PropertyModel) onFavoriteToggle;

  const PropertyListWidget({
    super.key,
    required this.properties,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (properties.isEmpty) {
      return NoPropertyFoundWidget();
    }

    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: properties.length,
      itemBuilder: (context, index) {
        return GlassmorphismWidget(
            blur: 100,
            borderRadius: BorderRadius.circular(16.r),
            height: 330.h,
            width: double.infinity,
            child: _buildPropertyCard(context, properties[index]));
      },
    );
  }

  Widget _buildPropertyCard(BuildContext context, PropertyModel property) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailScreen(property: property),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 23, 29, 29),
                blurRadius: 2,
                spreadRadius: 1,
                offset: const Offset(0, 1)),
          ],
          borderRadius: BorderRadius.circular(16.r),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 39, 58, 32),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            MainPropertyImageCard(
              property: property,
              onFavoriteToggle: () => onFavoriteToggle(property),
            ),
            _buildPropertyCardInfo(property),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyCardInfo(PropertyModel property) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.location_solid,
                  color: Colors.grey[500], size: 16.sp),
              6.hSpace,
              Text(
                property.location,
                style: AppTypography.bodyMedium,
              ),
              const Spacer(),
              Text(
                property.price,
                style:
                    AppTypography.heading3.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          6.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                property.title,
                style: AppTypography.heading4,
              ),
              _buildContactButton(),
            ],
          ),
          8.vSpace,
          Row(
            children: [
              _buildPropertyDetail(
                icon: Icons.bed,
                text: '${property.bedrooms}nd floor',
              ),
              16.hSpace,
              _buildPropertyDetail(
                icon: Icons.square_foot,
                text: '${property.sqFeet} Sqy',
              ),
              16.hSpace,
              _buildPropertyDetail(
                icon: Icons.bathtub,
                text: '${property.bathrooms} Brs',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetail({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey[500],
          size: 14.sp,
        ),
        4.hSpace,
        Text(
          text,
          style: AppTypography.bodySmall,
        ),
      ],
    );
  }

  Widget _buildContactButton() {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              Assets.icons.whatsApp.path,
              height: 25.h,
            ),
            2.hSpace,
            Text(
              'Contact',
              style: AppTypography.bodySmall.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
