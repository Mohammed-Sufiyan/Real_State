import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:real_estate/const/extension/sizedBox_extension.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/view/home/widget/glassmorphism.dart';

class DetailAppBar extends StatefulWidget {
  final PropertyModel property;
  final VoidCallback onFavoriteToggle;

  const DetailAppBar({
    super.key,
    required this.property,
    required this.onFavoriteToggle,
  });

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
          16.hSpace,
          GlassmorphismWidget(
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
        ],
      ),
    );
  }
}
