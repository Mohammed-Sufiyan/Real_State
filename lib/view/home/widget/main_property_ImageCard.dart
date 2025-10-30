import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:real_estate/const/app_colors.dart';
import 'package:real_estate/const/app_typography.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/view/home/widget/glassmorphism.dart';

class MainPropertyImageCard extends StatefulWidget {
  final PropertyModel property;
  final VoidCallback onFavoriteToggle;

  const MainPropertyImageCard({
    super.key,
    required this.property,
    required this.onFavoriteToggle,
  });

  @override
  State<MainPropertyImageCard> createState() => _MainPropertyImageCardState();
}

class _MainPropertyImageCardState extends State<MainPropertyImageCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
          child: Image.network(
            widget.property.imageUrl,
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12.h,
          left: 12.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 3, spreadRadius: 1)
              ],
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Text(
              'For Sale',
              style: AppTypography.caption.copyWith(color: Colors.black),
            ),
          ),
        ),
        Positioned(
          top: 12.h,
          right: 12.w,
          child: GestureDetector(
            onTap: widget.onFavoriteToggle,
            child: GlassmorphismWidget(
              blur: 40,
              height: 50,
              width: 50,
              borderRadius: BorderRadius.circular(100.r),
              child: LikeButton(
                size: 20.sp,
                isLiked: widget.property.isFavorite,
                likeBuilder: (isLiked) {
                  return Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.white,
                    size: 20.sp,
                  );
                },
                onTap: (isLiked) async {
                  setState(() {
                    widget.property.isFavorite = !widget.property.isFavorite;
                  });
                  return !isLiked;
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
