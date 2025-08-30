import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:texas/core/theming/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemImage extends StatelessWidget {
  final String image;
  const ItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128.w,
      decoration: BoxDecoration(
        color: ColorsManager.extraLightGreyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: ClipOval(
          child: CachedNetworkImage(
            width: 110.w,
            height: 110.h,
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => Skeletonizer(
              enabled: true,
              child: Image.asset(
                'assets/images/no_image.png',
                width: 110.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, size: 24.sp),
          ),
        ),
      ),
    );
  }
}
