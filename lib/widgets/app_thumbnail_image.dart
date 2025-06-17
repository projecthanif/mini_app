import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThumbnailImage extends StatelessWidget {
  const AppThumbnailImage({super.key, required this.thumbnail});
  final String? thumbnail;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: thumbnail == null
          ? Container(
              width: 100.w,
              height: 150.h,
              color: Colors.grey.shade300,
              alignment: Alignment.center,
              child: Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 40.sp,
              ),
            )
          : Image.network(
              thumbnail!,
              width: 150.w,
              height: 150.h,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 100.w,
                  height: 150.h,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100.w,
                  height: 150.h,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 40.sp,
                  ),
                );
              },
            ),
    );
  }
}
